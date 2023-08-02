//
//  ContentView.swift
//  EnachIntroDemoBuild
//
//  Created by Rishab Sudhir on 03/07/23.
//

import SwiftUI

struct ContentView: View{

    @State var selected = 0

    
    var data1: [DummyData] = [DummyData(image: "shippingbox", title: "LIMITED TIME", description: "1% cashback on Debit Card and Fi UPI spends up to ₹300 for 1 year", color: .red),DummyData(image: "shippingbox", title: "LIMITED TIME", description: "1% cashback on Debit Card and Fi UPI spends up to ₹300 for 1 year", color: .green),DummyData(image: "shippingbox", title: "LIMITED TIME", description: "1% cashback on Debit Card and Fi UPI spends up to ₹300 for 1 year", color: .blue),DummyData(image: "shippingbox", title: "LIMITED TIME", description: "1% cashback on Debit Card and Fi UPI spends up to ₹300 for 1 year", color: .yellow)]
    
    var data2: [DummyData] = [DummyData(image: "shippingbox", title: "LIMITED TIME", description: "1% cashback on Debit Card and Fi UPI spends up to ₹300 for 1 year", color: .green),DummyData(image: "shippingbox", title: "LIMITED TIME", description: "1% cashback on Debit Card and Fi UPI spends up to ₹300 for 1 year", color: .purple),DummyData(image: "shippingbox", title: "LIMITED TIME", description: "1% cashback on Debit Card and Fi UPI spends up to ₹300 for 1 year", color: .pink),DummyData(image: "shippingbox", title: "LIMITED TIME", description: "1% cashback on Debit Card and Fi UPI spends up to ₹300 for 1 year", color: .blue)]
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
            VStack{
                headerView
                ZStack{
                    graySheet
                    VStack{
                        SegmentedControl(selected: self.$selected)
                            .padding(.top, Constants.graySheetToSegmentedControl)
                        
                        Spacer().frame(height: Constants.segmentedControlToWhiteSheet)
                        
                        if self.selected == 0{
                            ZStack{
                                whiteSheet

                                BenefitsView(data: data1, selected: $selected).padding(.horizontal, 16)
                                bottomContainerView
                                    .ignoresSafeArea()
                                    .padding(.bottom, 0)
                            }
                            
                        }else{
                            ZStack{
                                whiteSheet
                                BenefitsView(data: data2, selected: $selected).padding(.horizontal, 16)
                                bottomContainerView
                                    .ignoresSafeArea()
                                    .padding(.bottom, 0)
                            }
                        }
                    }
                    
                }
            }
        }
    }
}


// MARK: - backgroundView Variables

var bottomContainerView: some View {
    VStack(alignment: .leading) {
        Spacer()
        ZStack {
            bottomWhiteSheet
            bottomGetAcessButton
        }
    }
}

var headerView: some View{
    VStack{
        box
            .padding(.top, Constants.navigationBarToBox)
        Spacer()
            .frame(height: Constants.boxToTitle)
        title
            .padding(.horizontal, Constants.titleFromEdges)
        Spacer()
            .frame(height: Constants.titleToDescription)
        description
            .padding(.horizontal, Constants.descriptionFromEdges)
        Spacer()
            .frame(height: Constants.descriptionToGraySheet)
    }
}


var box: some View{
    Image(systemName: "shippingbox")
        .resizable()
        .scaledToFit()
        .foregroundColor(.white)
        .frame(width: Constants.boxWidthHieght , height: Constants.boxWidthHieght)
}

var title: some View{
    Text(Constants.backgroundViewTitle)
        .fontWeight(.bold)
        .foregroundColor(.white)
        .font(.headline)
        .multilineTextAlignment(.center)
}

var description: some View{
    Text(Constants.backgroundViewDescription)
        .foregroundColor(.gray)
        .font(.subheadline)
        .multilineTextAlignment(.center)
}

var graySheet: some View{
    RoundedRectangle(cornerRadius: 32)
        .ignoresSafeArea()
        .foregroundColor(.gray)
}

var whiteSheet: some View{
    Rectangle()
    .ignoresSafeArea()
    .foregroundColor(.white)
}

var bottomWhiteSheet: some View{
    Rectangle()
        .background(Color.clear)
        .foregroundColor(Color.clear)
        .ignoresSafeArea()
        .linearGradient(
           colors: [.clear, .white],
           starts: UnitPoint(x: 0.5, y: 0),
           ends: UnitPoint(x: 0.5, y: 0.2)
        )
        .frame(width: UIScreen.main.bounds.width, height: 100)
}

var bottomGetAcessButton: some View{
    Button {
        return
    } label: {
        Text("Get Access")
            .foregroundColor(.white)
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .frame(width: 364, height: 40, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 19))
            .foregroundColor(.green)

    }
}

// MARK: - Constants Enum

private enum Constants{
    static let backgroundViewTitle = "Get faster access to salary benefits + a zero balance account"
    static let backgroundViewDescription = "Set up a monthly transfer from your existing salary account to your Federal Bank Savings account. Cancel anytime"
    
    //Spacing Integers for ContentView
    
    static let navigationBarToBox: CGFloat = 16
    static let boxToTitle: CGFloat = 16
    static let titleFromEdges: CGFloat = 40
    static let titleToDescription: CGFloat = 10
    static let descriptionFromEdges: CGFloat = 52
    static let descriptionToGraySheet: CGFloat = 34
    static let graySheetToSegmentedControl: CGFloat = 12
    static let segmentedControlToWhiteSheet: CGFloat = 12
    
    //ContentView Variables
    
    static let boxWidthHieght: CGFloat = 64
    static let graySheetCornerRadius: CGFloat = 32
    
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
