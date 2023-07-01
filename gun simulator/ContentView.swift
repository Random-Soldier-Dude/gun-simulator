//
//  ContentView.swift
//  gun simulator
//
//  Created by Yew Rei An on 31/5/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var start: Bool = false
    @State private var techMenu: Bool = false
    @State private var resetAlert: Bool = false
    @State private var saleMenu: Bool = false
    @State private var eventMenu: Bool = false
    @AppStorage("money") private var money: Int = 0
    @AppStorage("singleLoadTech") private var singleLoadTech: Bool = false
    @AppStorage("breakAction") private var breakAction: Bool = false
    @AppStorage("year") private var year: Int = 1500
    @AppStorage("stocks") private var stocks: Int = 0
    @AppStorage("militaryA") private var militaryA: Int = 0
    @AppStorage("militaryB") private var militaryB: Int = 0
    @AppStorage("militaryC") private var militaryC: Int = 0
    @AppStorage("militaryD") private var militaryD: Int = 0
    @AppStorage("civilianA") private var civilianA: Int = 0
    @AppStorage("civilianB") private var civilianB: Int = 0
    @AppStorage("civilianC") private var civilianC: Int = 0
    @AppStorage("civilianD") private var civilianD: Int = 0
    @AppStorage("accuracy") private var maxAccuracy: Double = 1
    @AppStorage("accuracyLevel") private var accuracyLevel: Int = 0
    @AppStorage("range") private var maxRange: Int = 10
    @AppStorage("rangeLevel") private var rangeLevel: Int = 0
    
    var body: some View {
        VStack {
            if start == false {
                Button {
                    start = true
                } label: {
                    Text("Start")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width:250)
                        .padding()
                        .background(.black)
                        .cornerRadius(100)
                }
            }
            if start == true {
                
                if techMenu == false && saleMenu == false && eventMenu == false {
                    VStack {
                        Text("The current year is \(year).")
                            .font(.title)
                        Text("You have $\(money).")
                            .font(.title)
                        Text("You have \(stocks) firearms.")
                            .font(.title)
                        if singleLoadTech == false {
                            Text("Start improving your current technology!")
                        } else if year == 1500 {
                            Text("Move over to the next year to produce some firearms!")
                        } else if stocks == 0 && money == 0 {
                            Text("Let us sell it to some people!")
                        }
                        VStack {
                            Button {
                                techMenu = true
                            } label: {
                                Text("Improve current technology.")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .frame(width:370, height: 50)
                                    .background(.black)
                                    .cornerRadius(100)
                            }
                            Button {
                                year += 1
                                stocks += 50
                            } label: {
                                Text("Proceed to the next year.")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .frame(width:370, height: 50)
                                    .background(.black)
                                    .cornerRadius(100)
                            }
                            Button {
                                saleMenu = true
                            } label: {
                                Text("Sell to customers!")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .frame(width:370, height: 50)
                                    .background(.black)
                                    .cornerRadius(100)
                            }
                            Button {
                                eventMenu = true
                            } label: {
                                Text("Watch current events.")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .frame(width:370, height: 50)
                                    .background(.black)
                                    .cornerRadius(100)
                            }
                            Button {
                                resetAlert = true
                            } label: {
                                Text("Reset progress")
                                    .foregroundColor(.white)
                                    .padding(5)
                                    .background(.red)
                                    .cornerRadius(100)
                                    .padding()
                            }
                            .alert("Are you sure?", isPresented: $resetAlert){
                                Button(role: .destructive) {
                                    year = 1500
                                    stocks = 0
                                    money = 0
                                    singleLoadTech = false
                                    breakAction = false
                                    militaryA = 0
                                    civilianA = 0
                                    militaryB = 0
                                    civilianB = 0
                                    militaryC = 0
                                    civilianC = 0
                                    militaryD = 0
                                    civilianD = 0
                                    maxAccuracy = 1
                                    accuracyLevel = 0
                                } label: {
                                    Text("Yes")
                                }
                                Button(role: .cancel) {
                                    
                                } label: {
                                    Text("No, take me back.")
                                }
                            }
                        }
                    }
                }
                if techMenu == true {
                    Text("You have $\(money)")
                    Text("👩‍🔬🧑‍🔬👩‍🔬🧑‍🔬👩‍🔬🧑‍🔬")
                    if singleLoadTech == false {
                        Button {
                            singleLoadTech = true
                        } label: {
                            Text("Barrel-loading technology - $0")
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 375)
                                .background(.black)
                                .cornerRadius(100)
                        }
                    }
                    if singleLoadTech == true {
                        Button {
                            if money >= (100<<accuracyLevel) {
                                maxAccuracy *= (0.75/Double(accuracyLevel))
                                money -= (100<<accuracyLevel)
                                accuracyLevel += 1
                            }
                        } label: {
                            Text("Improve accuracy level \(accuracyLevel+1) - $\(100<<accuracyLevel)")
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 375)
                                .background(.black)
                                .cornerRadius(100)
                        }
                        Button {
                            if money >= (100<<rangeLevel) {
                                maxRange *= (10*rangeLevel)
                                money -= (100<<rangeLevel)
                                rangeLevel += 1
                            }
                        } label: {
                            Text("Improve accuracy level \(accuracyLevel+1) - $\(100<<accuracyLevel)")
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 375)
                                .background(.black)
                                .cornerRadius(100)
                        }
                        Text("The maximum accuracy is \(maxAccuracy*60) MOA")
                    }
                    if year >= 1700 {
                        if breakAction == false {
                            Button {
                                breakAction = true
                            } label: {
                                Text("Break-Action Technology")
                            }
                        }
                    }
                    Button {
                        techMenu = false
                    } label: {
                        Text("Return to menu.")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(.black)
                            .cornerRadius(100)
                            .padding()
                    }
                }
                if saleMenu == true {
                    Text("Here are some countries you can sell to...")
                        .padding()
                    VStack {
                        HStack{
                            Text("Country A")
                            Button {
                                if stocks > 0 {
                                    money += 100
                                    militaryA += 1
                                    stocks -= 1
                                }
                            } label: {
                                Text("Military")
                            }
                            Button {
                                if stocks > 0 {
                                    money += 100
                                    civilianA += 1
                                    stocks -= 1
                                }
                            } label: {
                                Text("Civilian")
                            }
                        }
                        HStack{
                            Text("Country B")
                            Button {
                                if stocks > 0 {
                                    if (1519...1521).contains(year) {
                                        money += 250
                                    } else {
                                        money += 100
                                    }
                                    militaryB += 1
                                    stocks -= 1
                                }
                            } label: {
                                Text("Military")
                            }
                            Button {
                                if stocks > 0 {
                                    money += 100
                                    civilianB += 1
                                    stocks -= 1
                                }
                            } label: {
                                Text("Civilian")
                            }
                        }
                        HStack{
                            Text("Country C")
                            Button {
                                if stocks > 0 {
                                    if (1519...1521).contains(year) {
                                        money += 250
                                    } else {
                                        money += 100
                                    }
                                    militaryC += 1
                                    stocks -= 1
                                }
                            } label: {
                                Text("Military")
                            }
                            Button {
                                if stocks > 0 {
                                    money += 100
                                    civilianC += 1
                                    stocks -= 1
                                }
                            } label: {
                                Text("Civilian")
                            }
                        }
                        HStack{
                            Text("Country D")
                            Button {
                                if stocks > 0 {
                                    money += 100
                                    militaryD += 1
                                    stocks -= 1
                                }
                            } label: {
                                Text("Military")
                            }
                            Button {
                                if stocks > 0 {
                                    money += 100
                                    civilianD += 1
                                    stocks -= 1
                                }
                            } label: {
                                Text("Civilian")
                            }
                        }
                        Text(" ")
                        Text("You have sold \(civilianA+militaryA) firearms to A.")
                        Text("You have sold \(civilianB+militaryB) firearms to B.")
                        Text("You have sold \(civilianC+militaryC) firearms to C.")
                        Text("You have sold \(civilianD+militaryD) firearms to D.")
                        Button {
                            saleMenu = false
                        } label: {
                            Text("Return to menu.")
                                .foregroundColor(.white)
                                .padding(10)
                                .background(.black)
                                .cornerRadius(100)
                                .padding()
                        }
                    }
                }
                if eventMenu == true {
                    if (1519...1521).contains(year) {
                        Text("Country B is at war with Country C")
                        Text("Effects: Both militaries pay 2.5 times more.")
                        Text("Requirements: Barrel-loading technology")
                    } else {
                        Text("There is no events currently.")
                    }
                    Button {
                        eventMenu = false
                    } label: {
                        Text("Return to menu.")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(.black)
                            .cornerRadius(100)
                            .padding()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
