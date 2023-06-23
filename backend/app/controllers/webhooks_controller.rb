class WebhooksController < ApplicationController
  include ApplicationHelper

  skip_before_action :verify_authenticity_token

  def webhooks
    mode = params["hub.mode"]
    challenge = params["hub.challenge"]
    token_verify = params["hub.verify_token"]

    if mode == "subscribe" && token_verify == ENV["VERIFY_TOKEN"]
      render json: challenge, status: 200
    else
      render json: "Error", status: 403
    end
  end

  def receive
    if params[:entry][0][:changes][0][:value][:contacts]
      phone = params[:entry][0][:changes][0][:value][:contacts][0][:wa_id]
      message = params[:entry][0][:changes][0][:value][:messages][0][:text][:body]
      Message.create!(role:"user", content: message)

      reset = message.match(/^reset: (.+)/i)
      if reset.present?
        Message.destroy_all
        Message.create!(role: "system", content: reset[1])
        send_message(phone, "Ok, vou resetar minha memória. E salvar no sistema: #{reset[1]}")
      else
        response = get_openai_response(message)
        Message.create!(role:"assistant", content: response)
        send_message(phone, response)
      end
    end

    render json: "Success", status: 200
  end
end
