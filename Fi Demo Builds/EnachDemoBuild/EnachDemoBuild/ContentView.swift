//
//  ContentView.swift
//  EnachDemoBuild
//
//  Created by Rishab Sudhir on 03/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView{
            VStack(spacing: 10) {
                transferNotDetectedCard()
                healthInsuranceCard()
                quickLinkCard()
            }
            .padding()
        }
    }
    
//MARK: - Functions for Cards on ScrollView
    
    func transferNotDetectedCard() -> some View{
        ZStack{
            Rectangle()
                .foregroundColor(.gray)
                .frame(height: 332)
                .cornerRadius(15)
            VStack(alignment: .center){

                Spacer()
                
                exclaimationTriangle
                
                Spacer()
                    .frame(height: 12)
                
                transferNotDetectedCardTitle
                
                Spacer().frame(height: 16)
                
                transferNotDetectedCardDescription
                
                Spacer().frame(height: 24)
                
                transferNotDetectedCardButton
                
                Spacer()

            }
            .padding(.top, 40)
            .padding(.bottom, 24)
            .padding(.horizontal, 36)
        }
        .padding(.horizontal, 16)
    }
}

func healthInsuranceCard() -> some View{
    ZStack{
        Rectangle()
            .foregroundColor(.gray)
            .frame(height: 132)
            .cornerRadius(15)
        HStack{
            VStack(alignment: .leading){
                
                healthInsuranceCardTitle
                
                Spacer().frame(height: 14)
                
                healthInsuranceCardButton
                
            }
            .padding(.leading, 20)
//            .padding(.trailing, 160)
            
            healthInsuranceCardClipBoardImage
        }

    }
    .padding(.horizontal, 16)
}

func quickLinkCard() -> some View{
    ZStack{
        Rectangle()
            .foregroundColor(.clear)
        VStack{
            
            HStack(){
                
                quickLinkCardTitle
                Spacer()
                quickLinkCardViewAllButton
            }
            HStack{
                quickLinkCardSalaryOnFiButton
                quickLinkCardGetChequebookButton
            }
        }

    }
    .padding(.horizontal, 16)
    
}


// MARK: - Variables - transferNotDetectedCard

var exclaimationTriangle : some View{
    Image(systemName:"exclamationmark.triangle")
        .resizable()
             .scaledToFit()
             .frame(width: 25, height: 25)
        .foregroundColor(.white)
        .background(
            Circle()
                .frame(width:  44, height: 44)
        )
}

var transferNotDetectedCardTitle : some View{
    Text(Constants.transferNotDetectedCardTitle)
        .font(.title2)
        .multilineTextAlignment(.center)
    
}

var transferNotDetectedCardDescription : some View{
    Text(Constants.transferNotDetectedCardDescription)
        .font(.body)
        .multilineTextAlignment(.center)
}

var transferNotDetectedCardButton : some View{
    Button {
        return
    } label: {
        Text(Constants.transferNotDetectedCardButton)
            .foregroundColor(.white)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.white, lineWidth: 2)
        )
    }
}

// MARK: - Variables - HealthInsuranceCard

var healthInsuranceCardTitle : some View{
    Text(Constants.healthInsuranceCardTitle)
        .font(.headline)
        .multilineTextAlignment(.leading)
}

var healthInsuranceCardButton : some View{
    Button {
        return
    } label: {
        Text(Constants.healthInsuranceCardButton)
            .foregroundColor(.white)
            .multilineTextAlignment(.leading)
    }
}

var healthInsuranceCardClipBoardImage : some View{
    Image(systemName: "book")
        .resizable()
        .scaledToFit()
        .frame(width: 108,height: 108)
}

// MARK: - Variables - quickLinkCard

var quickLinkCardTitle : some View{
    Text(Constants.quickLinkCardTitle)
        .font(.headline)
        .multilineTextAlignment(.leading)
}

var quickLinkCardViewAllButton : some View{
    Button {
        return
    } label: {
        Text(Constants.quickLinkCardViewAllButton)
            .font(.headline)
            .foregroundColor(.black)
            .multilineTextAlignment(.trailing)
    }

}

var quickLinkCardSalaryOnFiButton : some View{
    Button {
        return
    } label: {
        ZStack{
            Rectangle()
                .foregroundColor(.gray)
                .frame(height: 72)
                .cornerRadius(15)
            HStack{
                Text(Constants.quickLinkCardViewAllButton)
                    .font(.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                Spacer()
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48,height: 48)
            }
            .padding(.leading, 12)
            .padding(.trailing, 12)

        }

    }

}

var quickLinkCardGetChequebookButton : some View{
    Button {
        return
    } label: {
        ZStack{
            Rectangle()
                .foregroundColor(.gray)
                .frame(height: 72)
                .cornerRadius(15)
            HStack{
                Text(Constants.quickLinkCardGetChequebookButton)
                    .font(.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                Spacer()
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48,height: 48)
            }
            .padding(.leading, 12)
            .padding(.trailing, 12)
        }

    }
}


// MARK: - Constants Enum
enum Constants {
    static let transferNotDetectedCardTitle = "Transfer not detected. Benefits expiring soon"
    static let transferNotDetectedCardDescription = "This could be due to a bank issue or insufficient funds in your other account. Please make sure you have sufficient funds for the transfer to avoid charges"
    static let transferNotDetectedCardButton = "See applicable charges"
    static let healthInsuranceCardTitle = "Unlock health insurance, early salary and more benefits"
    static let healthInsuranceCardButton = "Share account details  >"
    static let quickLinkCardTitle = "Quick Links"
    static let quickLinkCardViewAllButton = "VIEW ALL  >"
    static let quickLinkCardSalaryOnFiButton = "Already received salary on Fi?"
    static let quickLinkCardGetChequebookButton = "Get a Chequebook"
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
