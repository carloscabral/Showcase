//
//  VideoModel.swift
//  Showcase
//
//  Created by Carlos Cabral on 23/11/21.
//

import SwiftUI

struct Video: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let description: String
    let source: String
}

struct Videos {
    
    static let videoList = [
        Video(imageName: "abacomm", name: "Abacomm", description: "O ano de 2020 foi muito complicado em vários aspectos, mas ainda temos coisas para comemorar! Nesse video você conhece um pouco dos nossos números durante esse conturbado ano.", source: "https://vimeo.com/492521695"),
        Video(imageName: "pwc", name: "Pwc", description: "O projeto Revista CEO são edições digitais de uma revista voltada para o público C-Level da empresa, que organiza edições de forma estruturada, faz gestão do controle de acesso e coleta as avaliações e opiniões dos usuários sobre os conteúdos disponibilizados.", source: "https://vimeo.com/427154616"),
        Video(imageName: "sanofi", name: "Sanofi", description: "Vídeo de apresentação do projeto Direto ao Ponto, uma ferramenta desenvolvida para melhorar a experiência das atividades de coaching entre gestores e consultores da Sanofi.", source: "https://vimeo.com/557633920"),
        Video(imageName: "oxiteno", name: "Oxiteno", description: "Vídeo de apresentação do aplicativo mobile capaz de reconhecer códigos expostos em materiais durante eventos e apresentar de maneira atrativa todos os conteúdos relacionados aos mercados e produtos da Oxiteno.", source: "https://vimeo.com/431462957"),
        Video(imageName: "cinesystem", name: "CineSystem", description: "Proposta de solução da Abacomm para modernizar e digitalizar as plataformas digitais da Cinesystem, refazendo por completo todo o backend no servidor, a arquitetura de infraestrutura cloud, o site, app mobile e o programa de fidelidade Clube da Pipoca.", source: "https://vimeo.com/503165431"),
        Video(imageName: "neoenergia", name: "NeoEnergia", description: "Vídeo de demonstração do projeto da Neoenergia, que consiste na criação de um sistema para acompanhamento e gerenciamento de propostas, onde uma equipe capacitada coleta pedidos de cotação através de canais diversos.", source: "https://vimeo.com/459563253"),
        Video(imageName: "rbna", name: "RBNA", description: "Vídeo do sistema da RBNA Consult, onde os administradores da empresa listam, criam e convidam clientes para novas certificações. Os clientes podem acompanhar o andamento e revisar pendências pelo celular.", source: "https://vimeo.com/458780486"),
        Video(imageName: "ambev", name: "Ambev", description: "Proposta de solução da Abacomm para modernizar e digitalizar as atividades de gestão do Comitê de Melhores Práticas do grupo Ambev.", source: "https://vimeo.com/498735751")
    ]
}

