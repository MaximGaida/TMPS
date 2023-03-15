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
