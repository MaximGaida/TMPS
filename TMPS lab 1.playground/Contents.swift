// MessageSender Protocol
protocol MessageSender {
    func send(message: String, to: String)
}
 
// EmailSender Implementation
class EmailSender: MessageSender {
    func send(message: String, to: String) {
        print("Sending email to \(to): \(message)")
    }
}
 
// SMSSender Implementation
class SMSSender: MessageSender {
    func send(message: String, to: String) {
        print("Sending SMS to \(to): \(message)")
    }
}
 
// MessageReceiver Protocol
protocol MessageReceiver {
    func receive() -> String
}
 
// EmailReceiver Implementation
class EmailReceiver: MessageReceiver {
    func receive() -> String {
        return "Email message received"
    }
}
 
// SMSReceiver Implementation
class SMSReceiver: MessageReceiver {
    func receive() -> String {
        return "SMS message received"
    }
}
 
// MessageService Implementation
class MessageService {
    private let sender: MessageSender
    private let receiver: MessageReceiver
     
    init(sender: MessageSender, receiver: MessageReceiver) {
        self.sender = sender
        self.receiver = receiver
    }
     
    func sendMessage(message: String, to: String) {
        sender.send(message: message, to: to)
    }
     
    func receiveMessage() -> String {
        return receiver.receive()
    }
}
 
// Usage
let emailSender = EmailSender()
let emailReceiver = EmailReceiver()
let messageService = MessageService(sender: emailSender, receiver: emailReceiver)
messageService.sendMessage(message: "Hello, New User!", to: "user@example.com")
let receivedMessage = messageService.receiveMessage()
print(receivedMessage)

