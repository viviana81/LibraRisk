//
//  FakeServices.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 29/04/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import Foundation

struct FakeServices: Services {
    
    func getEarthQuakes(completion: @escaping ([EarthQuake]?, Error?) -> Void) {
        
        let earthQuakes = [
            EarthQuake(title: "Terremoto 1", url: "https://www.google.com"),
            EarthQuake(title: "Terremoto 2", url: "https://www.yahoo.it"),
            EarthQuake(title: "Terremoto 3", url: "https://www.yahoo.it"),
            EarthQuake(title: "Terremoto 4", url: "www.google.com"),
            EarthQuake(title: "Terremoto 5", url: "www.google.com")
        ]
        completion(earthQuakes, nil)
    }
    
    
    func getSismicRisk(completion: @escaping ([SismicRisk]?, Error?) -> Void) {
        
        let sismicRisks = [
            SismicRisk( title: "Aree di attesa", subtitle: "Aree coinvolte", description: "L’Italia è uno dei Paesi a maggiore rischio sismico del Mediterraneo, per la sua particolare posizione geografica, nella zona di convergenza tra la zolla africana e quella eurasiatica. La sismicità più elevata si concentra nella parte centro-meridionale della Penisola, lungo la dorsale appenninica (Val di Magra, Mugello, Val Tiberina, Val Nerina, Aquilano, Fucino, Valle del Liri, Beneventano, Irpinia), in Calabria e Sicilia e in alcune aree settentrionali, come il Friuli, parte del Veneto e la Liguria occidentale. Solo la Sardegna non risente particolarmente di eventi sismici.",imageUrl: ["https://i.pinimg.com/originals/db/1c/c9/db1cc92dba404432c6fd0defedae4178.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT4ojorkCdj5f-tbYXPxi-EolAG8HqACGXSQQ-YRocQyzvrO9np&usqp=CAU", "https://i.pinimg.com/originals/db/1c/c9/db1cc92dba404432c6fd0defedae4178.jpg"]),
            SismicRisk( title: "Pericolosità area di urbino", subtitle: "Aree di pericolosità", description: "La sismicità più elevata si concentra nella parte centro-meridionale della Penisola, lungo la dorsale appenninica (, in Calabria e Sicilia e in alcune aree settentrionali, come il Friuli, parte del Veneto e la Liguria occidentale. Solo la Sardegna non risente particolarmente di eventi sismici.", imageUrl: ["https://i.pinimg.com/originals/db/1c/c9/db1cc92dba404432c6fd0defedae4178.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT4ojorkCdj5f-tbYXPxi-EolAG8HqACGXSQQ-YRocQyzvrO9np&usqp=CAU", "https://i.pinimg.com/originals/db/1c/c9/db1cc92dba404432c6fd0defedae4178.jpg"])
        ]
        
        completion(sismicRisks, nil)
    }
    
    func getBehaviors(completion: @escaping ([Behavior]?, Error?) -> Void) {
        let behaviors = [
            Behavior(title: "Comportamento 1", subtitle: "Sottotitolo", description: "I terremoti si verificano quando la crosta terrestre si sposta, facendo in modo che le placche si spostino e si scontrino tra loro. Contrariamente agli uragani o agli allagamenti, i terremoti si manifestano senza preavviso e sono solitamente seguiti da scosse d'assestamento simili, che però di norma sono meno potenti del terremoto in sé. Se ti ritrovi nel bel mezzo di questo fenomeno naturale, spesso hai solo un quarto di secondo per decidere cosa fare. Studiare i consigli di questo articolo potrebbe determinare la differenza tra la vita e la morte.", imageUrl: ["https://i.pinimg.com/originals/db/1c/c9/db1cc92dba404432c6fd0defedae4178.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT4ojorkCdj5f-tbYXPxi-EolAG8HqACGXSQQ-YRocQyzvrO9np&usqp=CAU", "https://i.pinimg.com/originals/db/1c/c9/db1cc92dba404432c6fd0defedae4178.jpg"]),
            Behavior(title: "Comportamento 2", subtitle: "Sottotitolo", description: "I terremoti si verificano quando la crosta terrestre si sposta, facendo in modo che le placche si spostino e si scontrino tra loro. Contrariamente agli uragani o agli allagamenti, i terremoti si manifestano senza preavviso e sono solitamente seguiti da scosse d'assestamento simili, che però di norma sono meno potenti del terremoto in sé. Se ti ritrovi nel bel mezzo di questo fenomeno naturale, spesso hai solo un quarto di secondo per decidere cosa fare. Studiare i consigli di questo articolo potrebbe determinare la differenza tra la vita e la morte.", imageUrl: ["https://i.pinimg.com/originals/db/1c/c9/db1cc92dba404432c6fd0defedae4178.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT4ojorkCdj5f-tbYXPxi-EolAG8HqACGXSQQ-YRocQyzvrO9np&usqp=CAU", "https://i.pinimg.com/originals/db/1c/c9/db1cc92dba404432c6fd0defedae4178.jpg"]),
            Behavior(title: "Comportamento 3", subtitle: "Sottotitolo", description: "I terremoti si verificano quando la crosta terrestre si sposta, facendo in modo che le placche si spostino e si scontrino tra loro. Contrariamente agli uragani o agli allagamenti, i terremoti si manifestano senza preavviso e sono solitamente seguiti da scosse d'assestamento simili, che però di norma sono meno potenti del terremoto in sé. Se ti ritrovi nel bel mezzo di questo fenomeno naturale, spesso hai solo un quarto di secondo per decidere cosa fare. Studiare i consigli di questo articolo potrebbe determinare la differenza tra la vita e la morte.", imageUrl: ["https://i.pinimg.com/originals/db/1c/c9/db1cc92dba404432c6fd0defedae4178.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT4ojorkCdj5f-tbYXPxi-EolAG8HqACGXSQQ-YRocQyzvrO9np&usqp=CAU", "https://i.pinimg.com/originals/db/1c/c9/db1cc92dba404432c6fd0defedae4178.jpg"]),
            Behavior(title: "Comportamento 4", subtitle: "Sottotitolo", description: "I terremoti si verificano quando la crosta terrestre si sposta, facendo in modo che le placche si spostino e si scontrino tra loro. Contrariamente agli uragani o agli allagamenti, i terremoti si manifestano senza preavviso e sono solitamente seguiti da scosse d'assestamento simili, che però di norma sono meno potenti del terremoto in sé. Se ti ritrovi nel bel mezzo di questo fenomeno naturale, spesso hai solo un quarto di secondo per decidere cosa fare. Studiare i consigli di questo articolo potrebbe determinare la differenza tra la vita e la morte.", imageUrl: ["https://i.pinimg.com/originals/db/1c/c9/db1cc92dba404432c6fd0defedae4178.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT4ojorkCdj5f-tbYXPxi-EolAG8HqACGXSQQ-YRocQyzvrO9np&usqp=CAU", "https://i.pinimg.com/originals/db/1c/c9/db1cc92dba404432c6fd0defedae4178.jpg"]),
            Behavior(title: "Comportamento 5", subtitle: "Sottotitolo", description: "I terremoti si verificano quando la crosta terrestre si sposta, facendo in modo che le placche si spostino e si scontrino tra loro. Contrariamente agli uragani o agli allagamenti, i terremoti si manifestano senza preavviso e sono solitamente seguiti da scosse d'assestamento simili, che però di norma sono meno potenti del terremoto in sé. Se ti ritrovi nel bel mezzo di questo fenomeno naturale, spesso hai solo un quarto di secondo per decidere cosa fare. Studiare i consigli di questo articolo potrebbe determinare la differenza tra la vita e la morte.", imageUrl: ["https://i.pinimg.com/originals/db/1c/c9/db1cc92dba404432c6fd0defedae4178.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT4ojorkCdj5f-tbYXPxi-EolAG8HqACGXSQQ-YRocQyzvrO9np&usqp=CAU", "https://i.pinimg.com/originals/db/1c/c9/db1cc92dba404432c6fd0defedae4178.jpg"])
        ]
        completion(behaviors, nil)
    }
    
    func getNotifications(completion: @escaping ([Notification]?, Error?) -> Void) {
        let notifications = [
            Notification(title: "Notifica 1", subtitle: "Attenzione", body: "Una scossa di terremoto di magnitudo 5.3, si è verificata alle ore 09:04 con epicentro nei pressi di Klyuchi, Russia. La profondità stimata è stata di circa 59.13 Km", time: "7 minuti fa"),
            Notification(title: "Notifica 2", subtitle: "Attenzione", body: "Una scossa di terremoto di magnitudo 5.3, si è verificata alle ore 09:04 con epicentro nei pressi di Klyuchi, Russia. La profondità stimata è stata di circa 59.13 Km", time: "12 minuti fa"),
            Notification(title: "Notifica 3", subtitle: "Attenzione", body: "Una scossa di terremoto di magnitudo 5.3, si è verificata alle ore 09:04 con epicentro nei pressi di Klyuchi, Russia. La profondità stimata è stata di circa 59.13 Km", time: "16 minuti fa"),
            Notification(title: "Notifica 4", subtitle: "Attenzione", body: "Una scossa di terremoto di magnitudo 5.3, si è verificata alle ore 09:04 con epicentro nei pressi di Klyuchi, Russia. La profondità stimata è stata di circa 59.13 Km", time: "22 minuti fa"),
            Notification(title: "Notifica 5", subtitle: "Attenzione", body: "Una scossa di terremoto di magnitudo 5.3, si è verificata alle ore 09:04 con epicentro nei pressi di Klyuchi, Russia. La profondità stimata è stata di circa 59.13 Km", time: "27 minuti fa"),
            Notification(title: "Notifica 6", subtitle: "Attenzione", body: "Una scossa di terremoto di magnitudo 5.3, si è verificata alle ore 09:04 con epicentro nei pressi di Klyuchi, Russia. La profondità stimata è stata di circa 59.13 Km", time: "37 minuti fa"),
            Notification(title: "Notifica 7", subtitle: "Attenzione", body: "Una scossa di terremoto di magnitudo 5.3, si è verificata alle ore 09:04 con epicentro nei pressi di Klyuchi, Russia. La profondità stimata è stata di circa 59.13 Km", time: "42 minuti fa")
        ]
        completion(notifications, nil)
    }
    
    func getPlaces(completion: @escaping ([Place]?, Error?) -> Void) {
           let places = [
            Place(name:"Urbino", id: "03"),
            Place(name:"Avellino", id: "04"),
            Place(name:"Amatrice", id: "05")
        ]
        completion(places, nil)
       }
       
       func getColleges(completion: @escaping ([College]?, Error?) -> Void) {
           let colleges = [
               College(name:"Tridente", id: "015"),
               College(name:"Nettuno", id: "014"),
               College(name:"Ursula", id: "013")
           ]
        completion(colleges, nil)
       }
    
    
    func getCollegeResponse(place: Place, college: College, completion: @escaping (CollegeResponse?, Error?) -> Void) {
        
        let collegeResponse = CollegeResponse(title: "Collegio Tridente", subtitle: "Collegio Tridente ERSU URBINO", description: "Il Collegio Tridente dispone di n°352 camere singole; esse sono suddivise in blocchi da 16 camere. All’interno di ogni blocco i servizi igienici, la zona cucina e il citofono vengono condivisi da tutti gli abitanti del blocco. La portineria è aperta 24 ore su 24 fatte salve le chiusure come da calendario accademico.", imageUrl: ["https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSMnntb7oK6_v7dMfhMhMjia98Kv4OmXRP2c1xfMPDIy_hLn_9S&usqp=CAU", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQGDE8gmi7XQecize2JHSSNJdOORcEC7jHKtCgrsrqEwqWDDl8p&usqp=CAU"])
        
        completion(collegeResponse, nil)
    }
}
