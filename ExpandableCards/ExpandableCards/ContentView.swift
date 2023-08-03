//
//  ContentView.swift
//  ExpandableCards
//
//  Created by Rishab Sudhir on 03/08/23.
//

import SwiftUI

struct ContentView: View {
    @State var isExpanded: Bool = false
    var body: some View {
        VStack {
            if isExpanded {
                expandedCard
            } else {
                collapsedCard
                    .contentShape(Rectangle())
                    .onTapGesture {
                        toggleCollapsedState()
                    }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.gray)
        )
        
        .onAppear {
            withAnimation {
                isExpanded = false
            }
        }
    }
    
    private var expandedCard: some View {
        VStack(alignment: .leading) {
            VStack {
                HStack(alignment: .top) {
                    
                    Spacer().frame(width: 16)
                    
                    numericIcon
                    
                    Spacer().frame(width: Constants.CardWidthBetweenIconAndText)
                    
                    titleText
                    
                    Spacer()
                    
                    chevronUp
                    
                }
                .padding(.vertical, Constants.CardVerticalPaddingFromTextIcons) // surrounding padding
                .contentShape(Rectangle())
                .onTapGesture {
                    toggleCollapsedState()
                }
                
                rectangleContainingDetails
            }
        }
    }
    
    private var rectangleContainingDetails: some View {
        VStack(spacing: 20) {
            Spacer().frame(height: 5)

            Text("Hello1").padding(.horizontal, 20)
            
            Text("Hello2").padding(.horizontal, 20)
            
            Text("Hello3").padding(.horizontal, 20)
            
            Text("Hello4").padding(.horizontal, 20)
            
            Spacer().frame(height: 10)
            
            Text("Hello5").padding(.horizontal, 20)
            
        }
        .background(Color.white)
    }

    
    private var chevronDown: some View {
        Image(systemName: "chevron.down")
            .resizable()
            .frame(width: 24, height: 24)
            .padding(.trailing, Constants.CardChevronDistanceFromEdge)
    }
    
    private var chevronUp: some View {
        Image(systemName: "chevron.up")
            .resizable()
            .frame(width: 24, height: 24)
            .padding(.trailing, Constants.CardChevronDistanceFromEdge)
    }
    
    private var numericIcon: some View {
        Text("2")
            .padding(.horizontal, 7)
            .padding(.vertical, 2)
            .font(.caption2)
            .foregroundColor(.white)
            .background(
                Circle()
                    .fill(Color.black)
            )
    }
    
    private var titleText: some View {
        Text("details")
            .font(.title)
            .foregroundColor(.black)
        
    }
    
    private var collapsedCard: some View {
        HStack(alignment: .top) {
            
            Spacer().frame(width: 16)
            
            numericIcon
            
            Spacer().frame(width: Constants.CardWidthBetweenIconAndText)
            
            titleText
            
            Spacer()
            
            chevronDown
            
        }
        .padding(.vertical, Constants.CardVerticalPaddingFromTextIcons) // surrounding padding
        
    }
    
    private func toggleCollapsedState() {
        withAnimation {
            isExpanded.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

private enum Constants {
    static let CardHorizontalPadding: CGFloat = 16
    static let CardCornerRadius: CGFloat = 20
    static let CardWidthBetweenIconAndText: CGFloat = 8
    static let CardChevronDistanceFromEdge: CGFloat = 16
    static let CardVerticalPaddingFromTextIcons: CGFloat = 19
}
