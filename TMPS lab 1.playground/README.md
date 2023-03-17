## Acest cod este un exemplu de implementare a unui sistem de mesagerie prin utilizarea a mai multor protocoale și clase.

Prima parte a codului definește două protocoale, MessageSender și MessageReceiver, care definesc o interfață pentru a trimite și primi mesaje, respectiv. Apoi, sunt implementate două clase, EmailSender și SMSSender, care se conformează la protocolul MessageSender, și două clase, EmailReceiver și SMSReceiver, care se conformează la protocolul MessageReceiver. Aceste clase implementează funcționalitatea reală pentru trimiterea și primirea mesajelor.

În continuare, este implementată clasa MessageService, care utilizează obiectele de sender și receiver pentru a oferi servicii de trimitere și primire a mesajelor. Această clasă este inițializată cu un sender și un receiver și expune două metode publice, sendMessage și receiveMessage.

În final, se utilizează aceste clase și protocoale pentru a trimite și primi un mesaj prin intermediul unui obiect de MessageService. Obiectul de MessageService este creat cu un EmailSender și un EmailReceiver și este utilizat pentru a trimite un mesaj cu conținutul "Hello, New User!" la adresa "user@example.com". Apoi, mesajul primit este stocat într-o variabilă și este afișat în consolă cu ajutorul funcției print.


## Principiul Responsabilității Unice (SRP): 

Protocoalele 'MessageSender' și 'MessageReceiver' au responsabilități unice pentru trimiterea și primirea mesajelor, 
respectiv. Clasele 'EmailSender', 'SMSSender', 'EmailReceiver' și 'SMSReceiver' implementează aceste protocoale cu funcționalitățile lor 
specializate. 
 
## Principiul Deschis/Închis (OCP): 

Protocoalele 'MessageSender' și 'MessageReceiver' sunt deschise pentru extensie, 
dar închise pentru modificare. Noi implementări ale acestor protocoale pot fi adăugate fără a modifica codul existent. 
De exemplu, putem adăuga o nouă clasă 'SlackSender' care implementează protocolul 'MessageSender' pentru a trimite mesaje prin Slack,
fără a modifica clasa MessageService. 
 
## Principiul Substituției lui Liskov (LSP): 

Clasele 'EmailSender', 'SMSSender', 'EmailReceiver' și 'SMSReceiver' pot fi utilizate reciproc 
cu protocoalele 'MessageSender' și 'MessageReceiver' fără a afecta funcționalitatea clasei 'MessageService'. 
 
## Principiul Segregării Interfețelor (ISP): 

Protocoalele 'MessageSender' și 'MessageReceiver' au numai metodele necesare pentru responsabilitățile lor respective.
 Nu există metode suplimentare care nu ar fi necesare pentru implementarea lor. 
 
## Principiul Inversiunii Dependentei (DIP): 

Clasa 'MessageService' depinde de abstractizări (protocoalele 'MessageSender' și 'MessageReceiver') 
în loc de implementări concrete (clasele 'EmailSender', 'SMSSender', 'EmailReceiver' și 'SMSReceiver').
Acest lucru permite o testare, întreținere și extensibilitate mai ușoară a clasei 'MessageService'.


      // Definirea protocolului MessageSender, care trebuie sa contina o functie send ce primeste un mesaj si un destinatar
    protocol MessageSender {
    func send(message: String, to: String)
    }

      // Implementarea protocolului MessageSender pentru trimiterea de email-uri
    class EmailSender: MessageSender {
    // Definirea functiei send ce primeste un mesaj si un destinatar si afiseaza un mesaj de trimitere a unui email
    func send(message: String, to: String) {
    print("Sending email to (to): (message)")
    }
    }

    // Implementarea protocolului MessageSender pentru trimiterea de SMS-uri
    class SMSSender: MessageSender {
    // Definirea functiei send ce primeste un mesaj si un destinatar si afiseaza un mesaj de trimitere a unui SMS
    func send(message: String, to: String) {
    print("Sending SMS to (to): (message)")
    }
    }

    // Definirea protocolului MessageReceiver, care trebuie sa contina o functie receive ce returneaza un mesaj
    protocol MessageReceiver {
    func receive() -> String
    }

    // Implementarea protocolului MessageReceiver pentru primirea de email-uri
    class EmailReceiver: MessageReceiver {
    // Definirea functiei receive ce returneaza un mesaj de primire a unui email
    func receive() -> String {
    return "Email message received"
    }
    }

    // Implementarea protocolului MessageReceiver pentru primirea de SMS-uri
    class SMSReceiver: MessageReceiver {
    // Definirea functiei receive ce returneaza un mesaj de primire a unui SMS
    func receive() -> String {
    return "SMS message received"
    }
    }

    // Implementarea serviciului de mesagerie ce contine un sender si un receiver
    class MessageService {
    // Definirea variabilelor private pentru sender si receiver
    private let sender: MessageSender
    private let receiver: MessageReceiver

    swift
    Copy code
    // Initializarea serviciului de mesagerie cu sender-ul si receiver-ul specificate
    init(sender: MessageSender, receiver: MessageReceiver) {
        self.sender = sender
        self.receiver = receiver
    }

    // Functie ce trimite un mesaj primit prin parametrii la destinatarul specificat
    func sendMessage(message: String, to: String) {
        sender.send(message: message, to: to)
    }

    // Functie ce primeste un mesaj si il returneaza sub forma de string
    func receiveMessage() -> String {
        return receiver.receive()
    }
    }
