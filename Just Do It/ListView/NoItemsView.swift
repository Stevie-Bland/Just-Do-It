//
//  NoItemsView.swift
//  Just Do It
//
//  Created by Steven on 3/22/23.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate: Bool = false

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("Busy Day?")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(10)
                Text("Make it easier and start creating your to do list! 😉")
                    .padding(.bottom, 30)
                NavigationLink(destination: AddView(),
                               label: {
                                   Text("Add Something 🥳")
                                       .foregroundColor(.white)
                                       .font(.headline)
                                       .frame(height: 50)
                                       .frame(maxWidth: .infinity)
                                       .background(animate ? Color("AnimateColor") : Color("ButtonColor"))
                                       .cornerRadius(10)
                               })
                               .padding(.horizontal, animate ? 30 : 50)
                               .shadow(color: animate ? Color("AnimateColor").opacity(0.5) :
                                   Color("ButtonColor").opacity(0.5),
                                   radius: animate ? 30 : 10,
                                   x: 0,
                                   y: animate ? 50 : 30
                               )
                               .scaleEffect(animate ? 1.1 : 1.0)
                               .offset(y: animate ? -5 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NoItemsView()
            .navigationTitle("Title")
    }
}
