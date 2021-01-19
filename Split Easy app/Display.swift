//
//  Display.swift
//  Split Easy
//
//  Created by Lawrence Tsui on 19/1/21.
//

import SwiftUI
enum Coordinator {
  static func topViewController(_ viewController: UIViewController? = nil) -> UIViewController? {
    let vc = viewController ?? UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.rootViewController
    if let navigationController = vc as? UINavigationController {
      return topViewController(navigationController.topViewController)
    } else if let tabBarController = vc as? UITabBarController {
      return tabBarController.presentedViewController != nil ? topViewController(tabBarController.presentedViewController) : topViewController(tabBarController.selectedViewController)
      
    } else if let presentedViewController = vc?.presentedViewController {
      return topViewController(presentedViewController)
    }
    return vc
  }
}



extension Display {
  func shareApp() {
    let textToShare = "Amount for Eric Ho: $11\n Name: Lawrence Tsui\n BSB: 123-121 \n Account Number: 112121"
    let activityViewController = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
    
    let viewController = Coordinator.topViewController()
    activityViewController.popoverPresentationController?.sourceView = viewController?.view
    viewController?.present(activityViewController, animated: true, completion: nil)
  }
}


struct Display: View {
    @State private var name = ""
    @State private var checkAmount = ""
    @State private var checkAmount1 = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    let tipPercentages = [10, 15, 20, 25, 0]
    @State private var selected = 2

    var people = ["Tom Harrison", "Eric Ho", "Peter Zheng", "Tartan Chan"]
    var totalPerPerson: Double{
        let peopleCount = Double(numberOfPeople + 2)
        let tipsSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipsSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    @State private var currentSegment = 0
    var body: some View{
        NavigationView{
            Form{
                //$ is 2 way binding
                Section{
                    TextField("Your name", text: $name)
                  
                }
                Section{
                    TextField("BSB", text: $checkAmount)
                        .keyboardType(.decimalPad)
                }
                Section{
                    TextField("Account Number", text: $checkAmount1)
                        .keyboardType(.decimalPad)
                }
              
                Picker(selection: $selected, label: Text("Please choose a person")) {
                        ForEach(0 ..< people.count) {
                           Text(self.people[$0])
                        }
                     }
                     Text("You selected: \(people[selected])")
            
                Section{
                    if(selected == 0){
                    Text("$ 54")
                    }else if (selected == 1){
                        Text("$ 54")
                    }else if (selected == 2){
                        Text("$ 11")
                    }else if (selected == 3){
                        Text("$ 80")
                    }
                }
                Section{
                    Button(action: {
                      self.shareApp()
                    }) {
                      Text("Share amount and account number")
                    }
                }
            }.navigationBarTitle("Split Easy")
        }
        
        
        
        //        }
    }
}

struct Display_Previews: PreviewProvider {
    static var previews: some View {
        Display()
    }
}
