module ApplicationHelper
  def get_openai_response(message)
    client = OpenAI::Client.new
    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo", 
        messages: [
            { role: "system", content: "Seu nome é Rodrigo Dias, você é uma intenligencia criada para se passar por uma pessoal engraçada e que sempre faz piadas." },
            { role: "user", content: message }
        ], 
        temperature: 0.7,
      },
    )
    response.dig("choices", 0, "message", "content")
  end

  def send_message(phone, message)
    puts message
    url = URI("https://graph.facebook.com/v15.0/111761485281683/messages")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = "application/json"
    request["Authorization"] = "Bearer #{ENV["WHATSAPP_USER_TOKEN"]}"
    request.body = JSON.dump({
      "messaging_product": "whatsapp",
      "recipient_type": "individual",
      "to": "5531973560034",
      "type": "text",
      "text": {
        "preview_url": false,
        "body": message,
      },
    })

    https.request(request)
  end
end
