//
//  BenefitsNotIncludedView.swift
//  EnachIntroDemoBuild
//
//  Created by Rishab Sudhir on 05/07/23.
//

//
//  BenefitsIncludedView.swift
//  EnachIntroDemoBuild
//
//  Created by Rishab Sudhir on 05/07/23.
//

import SwiftUI


struct DummyData: Hashable{
    
    var image: String
    var title: String
    var description: String
    var color: Color

}


struct BenefitsView: View {
    
    var data: [DummyData]
    
    init(data: [DummyData]) {
        self.data = data
    }
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(spacing: 16){
                ForEach(data, id: \.self){data in
                    HStack{
                        VStack(alignment: .leading){
                            
                            capsuleTitle(title: data.title)
                            
                            Spacer().frame(height: Constants.titleToDescriptionSpacing)
                            
                            description(desc: data.description)

                        }
                        .frame(width:Constants.textFrameWidth,height: Constants.textFrameHeight)
                        .padding(.trailing,Constants.textToImagePadding)
                        
                        imageIcon(image: data.image)
                    }
                    .padding(Constants.cardBorderPadding)
                    .background(
                        RoundedRectangle(cornerRadius: Constants.backgroundRoundedRectangleRadius)
                            .foregroundColor(data.color)
                    )
                }
            }
        }
    }
    
    func capsuleTitle(title: String) -> some View{
        Text(title)
            .font(
            Font.custom("Gilroy", size: 10)
            .weight(.semibold)
            )
            .padding(.horizontal,Constants.spacingFromEdgeToText)
            .padding(.vertical,Constants.spacingFromtopBottomToText)
            .kerning(Constants.spacingBetweenLetters)
            .multilineTextAlignment(.center)
            .foregroundColor(Color(red: 0.39, green: 0.39, blue: 0.39))
            .background(
                RoundedRectangle(cornerRadius: Constants.roundedRectangleRadius)
                    .foregroundColor(.white)
            
            )
    }
    
    func description(desc: String) -> some View{
        Text(desc)
            .font(
            Font.custom("Gilroy", size: 16)
            .weight(.semibold)
            )
            .foregroundColor(.white)
            .frame(width: Constants.descriptionBoxWidth, height: Constants.descriptionBoxHeight, alignment: .topLeading)
    }
    
    func imageIcon(image: String) -> some View{
        Image(systemName: image)
            .resizable()
            .frame(width: 108, height: 108)
    }
    
    
}

private enum Constants{
    
    //Scroll View Constants
    
    static let titleToDescriptionSpacing : CGFloat = 24
    static let textFrameWidth: CGFloat = 195
    static let textFrameHeight: CGFloat = 100
    static let textToImagePadding: CGFloat = 29
    static let ImageFrameHeightWidth: CGFloat = 108
    static let cardBorderPadding: CGFloat = 16
    static let backgroundRoundedRectangleRadius: CGFloat = 25
    
    
    //capsule Title Ints
    
    static let spacingFromEdgeToText: CGFloat = 8
    static let spacingFromtopBottomToText: CGFloat = 2
    static let spacingBetweenLetters: CGFloat = 0.5
    static let roundedRectangleRadius: CGFloat = 8
    
    //Description Ints
    
    static let descriptionBoxWidth: CGFloat = 195
    static let descriptionBoxHeight: CGFloat = 60
}


