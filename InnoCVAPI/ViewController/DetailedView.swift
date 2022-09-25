//
//  DetailedView.swift
//  InnoCVAPI
//
//  Created by Martin Cordoba on 25/9/22.
//

import SwiftUI

struct DetailedView: View {
    
    var user: User
    
    var body: some View {
        VStack{
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 200,height: 200)
                .clipShape(Circle())
                .overlay(Circle()
                    .stroke(.gray,lineWidth: 3))
                .shadow(color:.gray, radius: 5)
            HStack {
                Text(user.name ?? "Nulo")
                    .font(.largeTitle)
                    
                Text(" - ")
                Text(String(user.id ?? 0))
                    .font(.title)
            }
            
            Text(user.birthdate ?? "Nulo")
                .font(.subheadline)
            
            Spacer()
        
        }
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(user: User(name: "Martin", birthdate: "1987-06-05", id: 1987))
    }
}
