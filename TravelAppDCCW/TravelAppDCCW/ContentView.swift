//
//  ContentView.swift
//  TravelAppDCCW
//
//  Created by Fazil P on 15/11/20.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var navBarHidden = false
    @State var show = false
    
    var rows = Array(repeating: GridItem(.fixed(270)), count: 1)
    var body: some View {
       
        NavigationView {
            ZStack {
                Color.gray.opacity(0.05)
                    .edgesIgnoringSafeArea(.top)
                
                VStack {
                    HStack {
                        Text("Explore")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        ZStack (alignment: .topTrailing) {
                            Image(systemName: "bell.circle")
                                .font(.title)
                                .foregroundColor(.gray)
                            
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 10, height: 10)
                        }
                    }
                    
                    SearchView(text: .constant(""))
                    
                    HStack {
                        Text("Trending Destinations")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Text("View all")
                                .font(.subheadline)
                        }
                    }.padding(.top, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false)
                    {
                        LazyHGrid(rows: rows, spacing: 20) {
                            ForEach(desData) { destination in
                                GeometryReader { geometry in
                                    NavigationLink(destination: DetailedViews(navBarHidden: $navBarHidden)) {
                                        CardView(destination: destination, minX: geometry.frame(in: .global).minX)
                                    }.buttonStyle(PlainButtonStyle())
                                }
                                .frame(maxHeight: .infinity)
                                .frame(width: 205)
                            }
                        }
                    }
                    
                    HStack {
                        Text("Top 10 destinations")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }.padding(.top, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        LazyHGrid(rows: Array(repeating: GridItem(.fixed(90)), count: 1), spacing: 20){
                            ForEach(desData){ i in
                                VStack {
                                    ZStack {
                                        Circle()
                                            .strokeBorder(Color.blue.opacity(0.6), lineWidth: 3)
                                            .frame(width: 65, height: 65)
                                        
                                        Image(i.title)
                                            .resizable()
                                            .frame(width: 55, height: 55)
                                            .scaledToFill()
                                            .clipShape(Circle())
                                    }
                                    
                                    Text(i.title )
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                }
                                .padding(.vertical, 10)
                                .onTapGesture {
                                    withAnimation(.default) {
                                        self.show.toggle()
                                    }
                                }
                            }
                        }
                    }
                    Spacer()
                    
                
                }
                .padding(.top, 40)
                .padding(.horizontal)
                
                VStack {
                    Spacer()
                    
                    BottomTabBar()
                }.edgesIgnoringSafeArea(.bottom)
                
                if self.show {
                    withAnimation(.default){
                        StoryView(show: $show)
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(self.navBarHidden)
            .onAppear(perform: {
                self.navBarHidden = true
            })
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Destination: Identifiable {
    
    var id = UUID()
    var title: String
    var subTitle: String
    var numOfAirlines: String
}

var desData = [
    Destination(title: "Japan", subTitle: "Tokyo", numOfAirlines: "18"),
    Destination(title: "Maldives", subTitle: "Maldive Islands", numOfAirlines: "15"),
    Destination(title: "Paris", subTitle: "France", numOfAirlines: "38"),
    Destination(title: "Nyc", subTitle: "London", numOfAirlines: "22"),
    Destination(title: "India", subTitle: "Kerala", numOfAirlines: "8"),
    Destination(title: "Turkey", subTitle: "Istanbul", numOfAirlines: "18"),
    Destination(title: "Dubai", subTitle: "Abu Dhabi", numOfAirlines: "12"),
    
    ]
