//
//  DetailedViews.swift
//  TravelAppDCCW
//
//  Created by Fazil P on 15/11/20.
//

import SwiftUI

struct DetailedViews: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var navBarHidden: Bool
    
    var body: some View {
        
        VStack {
            ZStack {
                Image("Japan")
                    .resizable()
                    .scaledToFill()
                    .clipShape(CustomShape(leftCorner: .bottomLeft, rightCorner: .bottomRight, radius: 30))
                    .frame(height: 260)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Destinations")
                        .font(.title)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                    
                    HStack(spacing: 20) {
                        VStack(alignment: .leading) {
                            Text("From")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text("Medan")
                                .font(.title)
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                            
                            Text("Indonesia")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        Image(systemName: "arrow.right.arrow.left")
                            .foregroundColor(.blue)
                            .font(Font.title2.bold())
                        
                        VStack(alignment: .leading) {
                            Text("To")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text("Tokyo")
                                .font(.title)
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                            
                            Text("Japan")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.8)
                    .padding(10)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(color: Color.gray.opacity(0.4), radius: 20, x: 0, y: 10)
                }
                .offset(x: 0, y: 100)
            }
            HStack(spacing: 5) {
                Button(action: {}, label: {
                    HStack {
                        Image(systemName: "airplane")
                            .font(Font.headline.weight(.bold))
                        Text("One way")
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .frame(width: (UIScreen.main.bounds.width * 0.8) / 2)
                    .background(Color.blue)
                    .cornerRadius(5)
                }).buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: {}, label: {
                    HStack {
                        Image(systemName: "arrow.clockwise")
                            .font(Font.headline.weight(.bold))
                        Text("Round trip")
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                })
                .foregroundColor(.gray)
                .buttonStyle(PlainButtonStyle())
                .padding(.vertical, 10)
                .frame(width: (UIScreen.main.bounds.width * 0.8) / 2)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(5)
            }
            .padding(.top, 50)
            .frame(width: (UIScreen.main.bounds.width * 0.8))
            
            Spacer()
            
            NavigationLink(
                destination: SingleFlight())
                 {
                HStack {
                    Text("SEARCH FLIGHT")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                    
                    Image(systemName: "arrow.right")
                        .font(Font.title3.weight(.semibold))
                }.foregroundColor(.white)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            .background(Color.blue)
            .buttonStyle(PlainButtonStyle())
            .frame(width: UIScreen.main.bounds.width * 0.8)
            .cornerRadius(10)
            .shadow(color: Color.blue.opacity(0.6), radius: 6, x: 0, y: 6)
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
        .onAppear() {
            self.navBarHidden = false
        }
        .navigationBarItems(leading:
                                Button(action: {
                                    self.presentationMode.wrappedValue.dismiss()
                                }){
                                    Image(systemName: "chevron.left")
                                        .font(Font.title2.bold())
                                        .foregroundColor(.white)
                                }, trailing:
                                    Button(action: {
                                        
                                    }){
                                        Image(systemName: "arrow.up.left.and.arrow.down.right")
                                            .font(Font.title2.bold())
                                            .foregroundColor(.white)
                                    }
        )
    }
}


struct CustomShape: Shape {
    var leftCorner: UIRectCorner
    var rightCorner: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [leftCorner, rightCorner], cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}




struct DetailedViews_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
