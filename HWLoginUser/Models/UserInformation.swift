//
//  userInformation.swift
//  HWLoginUser
//
//  Created by mac on 14.05.2023.
//


struct UserInfo {
    let userName: String
    let password: String
    
    let person: Person
    
    static func makeUser() -> UserInfo {
        UserInfo(
            userName: "user",
            password: "password",
            person: Person(
                name: "Michael",
                lastname: "Fassbender",
                profession: "actor",
                film: "Steve Jobs",
                role: "Steve Jobs",
                userImage: "photoUser",
                biography: bio
            )
        )
    }
}

 struct Person {
     let name: String
     let lastname: String
     let profession: String
     let film: String
     let role: String
     let userImage: String
     let biography: String
     
 }

let bio = "Майкл Фассбендер родился 2 апреля 1977 года в Гейдельберге, ФРГ. Мать — ирландка, отец — немец. Согласно семейному древу Фассбендера, мать — правнучатая племянница ирландского революционера Майкла Коллинза. В 1979 году семья переехала в город Килларни (Ирландия), где отец открыл ресторан West End House и работал там шеф-поваром./n В 2016 году был номинирован во второй раз на премию «Оскар» в номинации «Лучшая мужская роль» за роль основателя фирмы Apple Стива Джобса в фильме Дэнни Бойла - «Стив Джобс»."


