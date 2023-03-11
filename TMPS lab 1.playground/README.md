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
