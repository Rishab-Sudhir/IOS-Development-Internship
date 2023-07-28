//
//  SegmentControlComponent.swift
//  EnachIntroDemoBuild
//
//  Created by Rishab Sudhir on 05/07/23.
//

import Foundation
import SwiftUI

// MARK: - SegmentedControl using Buttons - Built for 2 menus, can be expanded

struct SegmentedControl : View {
    
    @Binding var selected : Int
    
    var body : some View{
        ZStack{
            HStack{
                Button {
                    self.selected = 0
                } label: {
                    
                    Text(Constants.buttonOneTitle)
                        .font(
                            Font.custom("Gilroy", size: 16)
                                .weight(.semibold)
                        )
                        .frame(height: Constants.heightOfButton)
                        .padding(.vertical, Constants.topOfButtonToText)
                        .padding(.horizontal,Constants.edgeOfButtonToText)
                        .background((self.selected == 0 ? Color.white :  Color.gray)
                        //change these colors if you want to change how the button background looks when its selected/not selected
                            .clipShape(RoundedRectangle(cornerRadius: Constants.roundedRectangleRadius))
                        )
                }
                .foregroundColor(self.selected == 0 ? .black :  .white)
                //change these colors if you want to change how the button text looks when its selected/not selected
                
                Button {
                    self.selected = 1
                } label: {
                    Text(Constants.buttonOneTitle)
                        .font(
                            Font.custom("Gilroy", size: 16)
                                .weight(.semibold)
                        )
                        .frame(height: Constants.heightOfButton)
                        .padding(.vertical,Constants.topOfButtonToText)
                        .padding(.horizontal,Constants.edgeOfButtonToText)
                        .background((self.selected == 1 ? Color.white :  Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius: Constants.roundedRectangleRadius))
                        )
                }
                .foregroundColor(self.selected == 1 ? .black :  .white)
            }
            
            
        }
    }
}


private enum Constants{
    
    //Button Titles
    
    static let buttonOneTitle: String = "Benefits included"
    static let buttonTwoTitle: String = "Not included"
    
    //Spacing Integers for SegmentControl
    
    static let heightOfButton: CGFloat = 36
    static let topOfButtonToText: CGFloat = 4
    static let edgeOfButtonToText: CGFloat = 12
    static let roundedRectangleRadius: CGFloat = 13
    
  
}

//MARK: - How to use
//
//@State var selected = 0
//
//VStack{
//
//    SegmentedControl(selected: self.$selected)
//
//    if self.selected == 0{    //View 1
//        ViewOne(data: data1)
//        }
//    }else{                   //View 2
//        ViewTwo(data: data2)
//    }
//}
//
