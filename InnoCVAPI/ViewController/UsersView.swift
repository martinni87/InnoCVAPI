//
//  UsersView.swift
//  InnoCVAPI
//
//  Created by Martin Cordoba on 25/9/22.
//

import SwiftUI

struct UsersView: View {
    @StateObject var usersModel = UsersModel()
    @State var inputText: String = ""
    
    var body: some View {
        NavigationView{
            VStack (alignment: .leading) {
                HStack{
                    TextField("Nombre", text: $inputText)
                        .padding(10)
                        .border(.gray)
                        .buttonBorderShape(.roundedRectangle(radius: 50))
                        .padding()
                }
        

                Button("New User"){
                    let lastID = usersModel.users.last?.id
                    
                    usersModel.addNewUser(name: inputText, birthdate: "New date to set", id: lastID! + 1)
                }
                .buttonStyle(.borderedProminent)
                .padding()

                List(usersModel.users) { user in
                    NavigationLink(destination: DetailedView(user: user)){
                        HStack{
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 40,height: 40)
                                .foregroundColor(.blue)
                                .padding()
                            VStack (alignment: .leading) {
                                Text(user.name ?? "Nulo")
                                    .font(.title)
                                Text(String(user.id ?? 0))
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }
                    }
                }
                .task {
                    print("loaded")
                    await self.usersModel.reload()
                }
                .refreshable {
                    print("reloaded")
                    await self.usersModel.reload()
                }
            }
                .navigationTitle("Lista de usuarios")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
