//
//  MoreInformationView.swift
//  AKPSI BU App
//
//  Created by Rishab Sudhir on 16/06/23.
//

import SwiftUI

struct MoreInformationView: View {
    var data: AkpsiDataModel
    init(data: AkpsiDataModel){
        self.data = data
    }
    
    var body: some View {
        VStack(){
            Spacer()
            VStack{
                names(fName: data.firstName, lName: data.lastName)
                if data.pledgeClass == ""{
                    pledgeClass(pc: "Unknown")
                }else{
                    pledgeClass(pc: data.pledgeClass)
                }
            }
            .padding()
            .background(
                Rectangle()
                .foregroundColor(.white)
                .shadow(radius: 15)
                .cornerRadius(15)
            )
            .padding()
            Spacer()
            VStack{
                    if data.currentCompany == ""{
                        currentCompany(company: "Unknown" )
                    }else{
                        currentCompany(company: data.currentCompany)
                    }
                    
                    if data.field == ""{
                        field(feild1: "Unknown")
                    }else{
                        field(feild1: data.field)
                    }
                    
                    if data.position == ""{
                        position(position: "Unknown")
                    }else{
                        position(position:  data.position)
                    }
                    
                    if data.Linkedin == ""{
                        linkedin(linkedin: "Unknown")
                    }else if data.Linkedin == nil{
                        linkedin(linkedin: "Unknown")
                    }
                    else{
                        linkedin(linkedin: data.Linkedin)
                    }
                    
                    if data.buEmail == ""{
                        buEmail(email: "Unknown")
                    }else if data.buEmail == nil{
                        buEmail(email: "Unknown")
                    }
                    else{
                        buEmail(email: data.buEmail!)
                    }
                    
                    if data.personalEmail == ""{
                        personalEmail(email: "Unknown")
                    }else if data.personalEmail == nil{
                        personalEmail(email: "Unknown")
                    }else{
                        personalEmail(email: data.personalEmail!)
                    }
                    
                if String(data.OriginalPhoneStr) == ""{
                    phoneNo(no: "Unknown")
                }else{
                    phoneNo(no: String(data.OriginalPhoneStr))
                }

                if data.location == ""{
                    location(location: "Unknown")
                }else{
                    location(location: data.location)
                }
            }
            .padding()
            .background(
            Rectangle()
                .foregroundColor(.white)
                .shadow(radius: 15)
                .cornerRadius(15)
            )
            .padding()
            Spacer()
        }.background(
            LinearGradient(
                colors: [.white, .blue],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )

    }
    
    func names(fName: String, lName: String) -> some View{
        HStack(alignment: .center){
            Text(fName)
                .font(.title)
                .bold()
                .foregroundColor(.yellow)
            Text(lName)
                .font(.title)
                .bold()
                .foregroundColor(.yellow)
        }
    }
    func pledgeClass(pc: String) -> some View{
        HStack(alignment: .center){
            Text(pc)
                .font(.title2)
        }
    }
    func currentCompany(company: String) -> some View{
        HStack{
            Text("Company : ")
                .font(.title3)
                .frame(width: 150,height: 20,alignment: .leading)
                .padding(.leading,30)
            Text(company)
                .font(.title3)
                .padding(.trailing,10)
            Spacer()

        }
    }
    func field(feild1: String) -> some View{
        HStack{
            Text("Field : ")
                .font(.title3)
                .multilineTextAlignment(.leading)
                .frame(width: 150,height: 20,alignment: .leading)
                .padding(.leading,30)
            Text(feild1)
                .font(.title3)
                .multilineTextAlignment(.leading)
                .padding(.trailing,10)
            Spacer()

        }
    }
    func position(position: String) -> some View{
        
        HStack{
            Text("Position : ")
                .font(.title3)
                .multilineTextAlignment(.leading)
                .frame(width: 150,height: 20,alignment: .leading)
                .padding(.leading,30)
            Text(position)
                .font(.title3)
                .multilineTextAlignment(.leading)
                .padding(.trailing,10)
            Spacer()

        }
    }
    func buEmail(email: String?) -> some View{
        HStack{
            Text("BU Email : ")
                .font(.title3)
                .frame(width: 150,height: 20,alignment: .leading)
                .multilineTextAlignment(.leading)
                .padding(.leading,30)
            if email == "Unknown"{
                Text(email!)
                    .font(.title3)
                    .multilineTextAlignment(.leading)
                    .padding(.trailing,10)
                Spacer()
            }else{
                if let url = URL(string: "mailto:" + email!) {
                    Link(email!, destination: url)
                        .multilineTextAlignment(.leading)
                        .padding(.trailing,10)
                        .foregroundColor(  .blue)
                    Spacer()
                } else {
                    // Handle the case where the URL couldn't be created.
                    Text("Invalid Email")
                    Spacer()
                }
                
            }


        }
    }
    func personalEmail(email: String?) -> some View{
        HStack{
            Text("Personal Email : ")
                .font(.title3)
                .frame(width: 150,height: 20,alignment: .leading)
                .multilineTextAlignment(.leading)
                .padding(.leading,30)
            if email == "Unknown"{
                Text(email!)
                    .font(.title3)
                    .multilineTextAlignment(.leading)
                    .padding(.trailing,10)
                Spacer()
            }else{
                if let url = URL(string: "mailto:" + email!) {
                    Link(email!, destination: url)
                        .multilineTextAlignment(.leading)
                        .padding(.trailing,10)
                        .foregroundColor(  .blue)
                    Spacer()
                } else {
                    // Handle the case where the URL couldn't be created.
                    Text("Invalid Email")
                    Spacer()
                }
                
            }

        }
    }
    func phoneNo(no: String) -> some View{
        HStack{
            Text("Phone No. : ")
                .font(.title3)
                .frame(width: 150,height: 20,alignment: .leading)
                .multilineTextAlignment(.leading)
                .padding(.leading,30)
            if no == "Unknown"{
                Text(no)
                    .font(.title3)
                    .multilineTextAlignment(.leading)
                    .padding(.trailing,10)
                Spacer()
            }else{
                if let url = URL(string: "tel:" + no) {
                    Link(no, destination: url)
                        .multilineTextAlignment(.leading)
                        .padding(.trailing,10)
                        .foregroundColor(  .blue)
                    Spacer()
                } else {
                    // Handle the case where the URL couldn't be created.
                    Text("Invalid Number")
                    Spacer()
                }
                
            }
        }
    }
    func location(location: String) -> some View{
        HStack{
            Text("Location : ")
                .font(.title3)
                .frame(width: 150,height: 20,alignment: .leading)
                .multilineTextAlignment(.leading)
                .padding(.leading,30)
            Text(location)
                .font(.title3)
                .multilineTextAlignment(.leading)
                .padding(.trailing,10)
            Spacer()

        }
    }
    func linkedin(linkedin: String?) -> some View{
        HStack{
            Text("LinkedIn : ")
                .font(.title3)
                .frame(width: 150,height: 20,alignment: .leading)
                .multilineTextAlignment(.leading)
                .padding(.leading,30)
            if linkedin == "Unknown"{
                Text(linkedin!)
                    .font(.title3)
                    .multilineTextAlignment(.leading)
                    .padding(.trailing,10)
                Spacer()
            }else{
                if let url = URL(string: linkedin!) {
                    Link(linkedin!, destination: url)
                        .multilineTextAlignment(.leading)
                        .padding(.trailing,10)
                        .foregroundColor(  .blue)
                    Spacer()
                } else {
                    // Handle the case where the URL couldn't be created.
                    Text("Invalid URL")
                    Spacer()
                }

            }
        }
    }

    var separatorView: some View {
        Color(.gray)
            .frame(width:2.0,height:2.0)
    }
}
