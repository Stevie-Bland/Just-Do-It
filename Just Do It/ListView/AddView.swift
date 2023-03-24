//
//  AddView.swift
//  Just Do It
//
//  Created by Steven on 3/16/23.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var textFieldString: String = ""

    @State var alertTitle: String = ""
    @State var showAlert: Bool = false

    var body: some View {
        ScrollView {
            VStack {
                TextField("What to do today?", text: $textFieldString)
                    .multilineTextAlignment(.center)
                    .padding(.leading)
                    .frame(height: 50)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(50)

                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 40)
                        .frame(maxWidth: 70)
                        .background(Color("ButtonColor")
                            .cornerRadius(80)
                        )
                })
            }
            .padding(20)
        }
        .navigationTitle("Add an Item ⤵")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showAlert, content: getAlert)
    }

    func saveButtonPressed() {
        if textIsAppropriate() == true {
            listViewModel.addItem(title: textFieldString)
            presentationMode.wrappedValue.dismiss()
        }
    }

    func textIsAppropriate() -> Bool {
        if textFieldString.count < 3 {
            alertTitle = "Your new to do item must be 3 characters long! 🙄"
            showAlert.toggle()
            return false
        }
        return true
    }

    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
