//
//  RowViewModel.swift
//  InnoCVAPI
//
//  Created by Martin Cordoba on 25/9/22.
//

import SwiftUI

struct RowViewModel: View {
    @StateObject var usersModel = UsersModel()
    var body: some View {
            HStack{
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 40,height: 40)
                    .foregroundColor(.blue)
                    .padding()
                VStack (alignment: .leading) {
                    Text(user.name ?? "Martin")
                        .font(.title)
                    Text(String(user.id ?? 8719))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
        }
}

struct RowViewModel_Previews: PreviewProvider {
    static var previews: some View {
        RowViewModel()
    }
}
