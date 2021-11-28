//
//  Team.swift
//  Showcase
//
//  Created by Carlos Cabral on 24/11/21.
//

import SwiftUI

struct Team: Identifiable, Hashable {
    var id = UUID().uuidString
    var imageURL: String
    var name: String
    var description: String
    var jobTitle: String
    var jobCategory: String
    var socialNetworks: [SocialNetwork]
}

struct SocialNetwork: Identifiable, Hashable {
    var id = UUID().uuidString
    var name: String
    var URL: String
}

struct TeamCollection {
    
    static let teamList = [
        Team(
            imageURL: "adrianne",
            name:"Adrianne Toledo",
            description: "Graduada em Análise de Sistemas com especialização em Engenharia de Software, grande entusiasta de tecnologia e inovação, adora uma novidade! Curte música, cinema, séries e passeios ao ar livre. É ela quem garante a qualidade dos nossos produtos!",
            jobTitle: "QA",
            jobCategory: "Projetos",
            socialNetworks: [SocialNetwork(name: "linkedin", URL: "https://www.linkedin.com/in/adrianne-de-toledo-79b1a221/")]
        ),
        
        Team(
            imageURL: "allan",
            name: "Allan Alexandre",
            description: "Nosso mestre do Frontend! Ama ficar com a família, assistir filmes, jogos de fps e esporte (e ainda sabe cozinhar!). No tempo livre, adora estudar coisas novas e colaborar em projetos open source.", jobTitle: "Engenheiro de Frontend",
            jobCategory: "Projetos",
            socialNetworks: [SocialNetwork(name: "linkedin", URL: "https://www.linkedin.com/in/allan-a-b1911729/"), SocialNetwork(name: "twitter", URL: "https://twitter.com/allanalexandre")]
        ),
        
        Team(
            imageURL: "carlos",
            name: "Carlos Cabral",
            description: "Carlos é responsável pela experiência de usuário e fluxo visual dos nossos projetos, além de fornecer direcionamento estratégico para a área de criação.",
            jobTitle: "CDO",
            jobCategory: "Criação",
            socialNetworks: [SocialNetwork(name: "linkedin", URL: "https://www.linkedin.com/in/cgcabral/"), SocialNetwork(name: "twitter", URL: "https://twitter.com/cgcabral"), SocialNetwork(name: "instagram", URL: "https://www.instagram.com/carloscabralart/")]
        ),
        
        Team(
            imageURL: "douglas",
            name: "Douglas Fischer",
            description: "Com ampla experiência em projetos e empresas anteriores, encontrou na Abacomm o seu lar. Já foi podcaster, é ávido leitor de feeds, apaixonado por Arctic Monkeys e, claro, iOS! É ele quem dá o direcionamento tecnológico para toda a empresa.",
            jobTitle: "CTO",
            jobCategory: "Projetos",
            socialNetworks: [SocialNetwork(name: "linkedin", URL: "https://www.linkedin.com/in/dougdiskin/"), SocialNetwork(name: "twitter", URL: "https://twitter.com/dougdiskin"), SocialNetwork(name: "instagram", URL: "https://www.instagram.com/dougdiskin/")]
        ),
        
        Team(
            imageURL: "fabio",
            name: "Fábio Dametto",
            description: "Administrador formado pela UERJ com MBA Executivo no COPPEAD, tem sólida experiência comercial na área de canais de vendas diretos e indiretos, tendo atuado também na área de desenvolvimento de diversos outros canais (carteiras, metas, remuneração variável, etc.). O trabalho do Fábio é totalmente focado em resultados e pessoas.",
            jobTitle: "Sales Director",
            jobCategory: "Comercial",
            socialNetworks: [SocialNetwork(name: "linkedin", URL: "https://www.linkedin.com/in/dametto-empreendedor-comercial-inovacao/"), SocialNetwork(name: "instagram", URL: "https://www.instagram.com/dametto_fabio/")]
        ),
        
        Team(
            imageURL: "filipe",
            name: "Filipe Neis",
            description: "Filipe iniciou no desenvolvimento com o Protheus e, desde 2015, se dedica à área de mobile. Hoje ele é nosso mestre de Android! Nas suas horas vagas ele gosta de praticar esportes, jogar fifa, assistir filmes, ouvir música e curtir uma praia.",
            jobTitle: "Engenheiro de Android",
            jobCategory: "Projetos",
            socialNetworks: [SocialNetwork(name: "linkedin", URL: "https://www.linkedin.com/in/filipe-amaral-n%C3%A9is-00852089/")]
        ),
        
        Team(
            imageURL: "gabi",
            name: "Gabriela Salman",
            description: "Natural do Amapá, Gabi adora criar conexões! Ela é a responsável por toda a comunicação, interna e externa da Abacomm. Ah, não pode deixar de mencionar que ela é atriz, dubladora e fã de musicais! (Além de ser a caçula da equipe).",
            jobTitle: "Analista de comunicação",
            jobCategory: "Comunicação",
            socialNetworks: [SocialNetwork(name: "instagram", URL: "https://www.instagram.com/gabsalman/")]
         ),
        
        Team(
            imageURL: "guilherme",
            name: "Guilherme Chagas",
            description: "Com vasto conhecimento sobre programação Server-side com PHP, é apaixonado por tecnologia e desenvolvimento desde 2012. Tem como objetivo ajudar profissionais e amigos à construir coisas fantásticas. Adora tomar cerveja e café.",
            jobTitle: "Engenheiro de Backend",
            jobCategory: "Desenvolvimento",
            socialNetworks: []
        ),
        
        Team(
            imageURL: "joao",
            name: "João Gomes",
            description: "João é responsável pelo suporte de segundo nível, tendo que implementar e criar soluções para satisfação dos nossos clientes. Nas horas vagas, João foca em treinar para disputar torneios de handebol pelo Rio de Janeiro!",
            jobTitle: "Analista de Suporte",
            jobCategory: "Customer Success",
            socialNetworks: [SocialNetwork(name: "linkedin", URL: "https://www.linkedin.com/in/jo%C3%A3o-gomes-827b47b4/")]
        ),
        
        Team(
            imageURL: "junior",
            name: "Júnior Rodrigues",
            description: "Júnior é o coração da nossa Operação. É ele o responsável em manter a máquina funcionando ao mesmo tempo que garante a satisfação dos nossos clientes. Além de estudar para ser um multi-instrumentista, ainda é muito fera no marketing digital!",
            jobTitle: "Analista de Operações",
            jobCategory: "Operação",
            socialNetworks: [SocialNetwork(name: "linkedin", URL: "https://www.linkedin.com/in/junior-rodrigues-99268a10b/"), SocialNetwork(name: "instagram", URL: "https://www.instagram.com/mktdigital.junior/")]
        ),
        
        Team(
            imageURL: "lucas",
            name: "Lucas Fernandes",
            description: "Excelente desenvolvedor e apaixonado em como a tecnologia pode realmente impactar vidas, nas horas vagas Lucas curte andar de skate, nadar e assistir um futebol!",
            jobTitle: "Desenvolvedor Android",
            jobCategory: "Projetos",
            socialNetworks: [SocialNetwork(name: "linkedin", URL: "https://www.linkedin.com/in/lucas-fernandes-249b7a1a1/")]
        ),
        
        Team(
            imageURL: "rachel",
            name: "Rachel Dalfior",
            description: "Tendo trabalhado como gestora e consultora e com mais de 18 anos de experiência no mercado nacional e internacional de TI (ela morou em Tóquio!), Rachel é mais do que especialista em gerenciamento de projetos. Mas ela também adora cinema, Netflix e passar os dias ao lado da filhota!",
            jobTitle: "Gerente de Projetos",
            jobCategory: "Projetos",
            socialNetworks: [SocialNetwork(name: "linkedin", URL: "https://www.linkedin.com/in/rachel-dalfior-a8a2a632/")]
        ),
        
        Team(
            imageURL: "rodrigo",
            name: "Rodrigo Viana",
            description: "Designer, Ilustrador, Editor de vídeo, Game Maker, User Interface e Motion Graphics! Esse é nosso designer, responsável por deixar tudo lindo e funcional. Nas horas vagas, Rodrigo consome metal, música eletrônica, livros e jogos online.",
            jobTitle: "Design e Motion",
            jobCategory: "Criação",
            socialNetworks: [SocialNetwork(name: "linkedin", URL: "https://www.linkedin.com/in/rodrigocpviana/")]
        ),
        
        Team(
            imageURL: "roger",
            name: "Roger Vaz",
            description: "Com uma experiência de mais de 10 anos na área de TI, Roger é especialista na resolução de problemas complexos, principalmente na configuração de sistemas de acesso. É nossa bala de prata no suporte de segundo nível!",
            jobTitle: "Analista de Suporte",
            jobCategory: "Customer Success",
            socialNetworks: [SocialNetwork(name: "linkedin", URL: "https://www.linkedin.com/in/roger-vaz-8ab224224/")]
        )
    ]
}
