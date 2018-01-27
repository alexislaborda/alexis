//
//  Topics.swift
//  Alexis
//
//  Created by Alexis Laborda on 26/01/2018.
//  Copyright © 2018 Alexis Laborda. All rights reserved.
//

import Foundation

extension Date {
    var age: Int {
        return Calendar.current.dateComponents([.year], from: self, to: Date()).year!
    }
}

enum TopicNumber {
    case hotWheels, music, video, antique, son, bottles, oldSign, humidifier, programmingLife, starWars
}

struct Topic {
    
    var number: TopicNumber
    var description: String
    var founded: Bool
    
    init(number: TopicNumber, description: String) {
        
        self.number = number
        self.description = description
        self.founded = false
    }
}

class Topics {
    
    static let sharedInstance = Topics()
    
    var topics = [Topic]()
    
    init() {

        let birthDate = Calendar.current.date(from: DateComponents(year: 2011, month: 3, day: 17))!

        topics.append(Topic(number: .hotWheels, description: "Gosto muito de carros e de colecionáveis, então nada mais lógico que colecionar HotWheels, parei nos 200, por falta de espaço."))
        topics.append(Topic(number: .music, description: "Escute algumas das minhas músicas preferidas."))
        topics.append(Topic(number: .video, description: "Veja alguns exemplos do que assisto."))
        topics.append(Topic(number: .antique, description: "Gosto de algumas antiguidades, como telefones, câmeras fotográficas e relógios."))
        topics.append(Topic(number: .son, description: "Nessa foto, estou com meu filho, Carlos Eduardo, que está com \(birthDate.age) anos."))
        topics.append(Topic(number: .bottles, description: "Sempre compro e guardo garrafas comemorativas da Coca-cola, todas lacradas."))
        topics.append(Topic(number: .oldSign, description: "E existe item de decoração melhor do que placas ou cartazes antigos?"))
        topics.append(Topic(number: .humidifier, description: "Fico bastante incomodado quando o ar está muito seco, então nada melhor que ter um humidificador em casa e outro no trabalho =)"))
        topics.append(Topic(number: .programmingLife, description: "Boa parte da minha vida se passa programando, das 8:30 às 18:00 no trabalho e das 19:00 até a hora que for necessário no ADA ou em casa."))
        topics.append(Topic(number: .starWars, description: "Sim, eu gosto de Star Wars, caso tenha ficado em dúvida... Até mesmo dos episódios I, II e III."))
    }
    
    func countFounded() -> Int {
        
        var count = 0
        
        for t in topics {
            
            if t.founded == true {
                
                count += 1
            }
        }
        
        return count
    }
    
    func getDescription(topicNumber: TopicNumber) -> String {
        
        var index = 0
        for t in topics {
            
            if t.number == topicNumber {
                
                topics[index].founded = true
                return t.description
            }
            
            index += 1
        }
        
        return ""
    }
}
