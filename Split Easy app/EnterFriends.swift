//
//  EnterFriends.swift
//  Split Easy
//
//  Created by Lawrence Tsui on 19/1/21.
//

import SwiftUI

struct EnterFriends: View {
    @State private var name = ""
    @State private var amount = ""
    @State private var currentSegment = 0
    @State private var current = 0
    @State private var numberOfPeople = 2
    @State public var filled = 0
    var body: some View {

        NavigationView{
            Form{
                Picker("Select how many people", selection: $numberOfPeople){
                    ForEach(2 ..< 100){
                        Text("\($0) people")
                        
                    }
                    
                }
            
                ForEach(0 ... numberOfPeople, id: \.self){_ in
                    Section{
                    TextField("Name", text: $name)
                        TextField("Paid amount", text: $amount).keyboardType(.decimalPad)
                    }
                }
//            VStack {
//                Picker("A or B", selection: $currentSegment) {
//
//                    Text("Enter").tag(1)
//                }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)
//            }
//            if currentSegment == 1{
//
//
//            }
            }.navigationBarTitle("Split Easy")
        }
    }
    
}



struct EnterFriends_Previews: PreviewProvider {
    static var previews: some View {
        EnterFriends()
    }
}
