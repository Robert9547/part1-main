//
//  CreatorJoin.swift
//  part1
//
//  Created by 賴冠宏 on 2022/6/18.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseFirestore

struct CreatorJoin: View {
    @Binding var emailIn:String
    @State private var name = ""
    @State private var country = ""
    @State private var birthday = ""
    @State private var sex = ""
    @State private var money = 0
    @State private var image = ""
    @State private var back = false
    
    
    func fetchData(email: String){
        let db = Firestore.firestore()
        db.collection("RoleDatas").whereField("email", isEqualTo: "\(emailIn)").getDocuments { snapshot, error in

            snapshot!.documents.forEach { snapshot in
                name = snapshot.data()["name"] as! String
                sex = snapshot.data()["sex"] as! String
                country = snapshot.data()["country"] as! String
                birthday = snapshot.data()["birthday"] as! String
                money = snapshot.data()["money"] as! Int
                image = snapshot.data()["image"] as! String
                
            }
        }
    }
    var body: some View {
            VStack{
                ZStack{
                    //Text("錢: \(money)")
                    
                    Button("創立房間"){
                        //signIn()
                    }
                    .foregroundColor(.white)
                    .frame(width: 200, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(8)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .offset(x:0, y:-80)
                    
                    Button("加入"){
                        //signIn()
                    }
                    .foregroundColor(.white)
                    .frame(width: 200, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(8)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                    Button("看廣告賺錢！"){
                        //signIn()
                        //money += 500
                    }
                    .foregroundColor(.white)
                    .frame(width: 200, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(8)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .offset(x:0, y:80)
                }
                
                .onAppear{
                    fetchData(email: "\(emailIn)")
                }
                
            }
            .navigationTitle("個人頁面")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                       
                    } label: {
                        Text("")
                    }
                }
                ToolbarItem{
                    Text("$:\(money)")
                    .foregroundColor(.green)
                }
                
                ToolbarItemGroup(placement: .bottomBar) {
                    Button {
                        
                    } label: {
                        Image(systemName: "gearshape")
                    }
                    Spacer()
                }
                
                ToolbarItemGroup(placement: .bottomBar) {
                    Button {
                                        
                    } label: {
                        Image(systemName: "crown")
                    }
                }
            }
    }
}

//struct CreatorJoin_Previews: PreviewProvider {
//    static var previews: some View {
//        CreatorJoin()
//    }
//}
