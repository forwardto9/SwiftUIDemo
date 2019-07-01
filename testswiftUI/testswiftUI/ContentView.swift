//
//  ContentView.swift
//  testswiftUI
//
//  Created by uwei on 2019/6/11.
//  Copyright © 2019 TEG of Tencent. All rights reserved.
//

import SwiftUI
import Foundation


struct Profile {
    var seasonalPhoto: Season
    static let `default` = Self(seasonalPhoto: .winter)
    
    enum Season: String, CaseIterable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
    }
}

struct DetailView:View {
    @Binding var profile: Profile
    var body:some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Seasonal Photo").bold()
            
            SegmentedControl(selection: $profile.seasonalPhoto) {
                ForEach(Profile.Season.allCases.identified(by: \.self)) { season in
                    Text(season.rawValue).tag(season)
                }
            }
            }
            .padding(.top)
    }
}


struct TextfiledView:View {
    @Binding var name:String
    var body: some View {
        TextField(self.$name, placeholder: Text("nono"))
    }
}



struct ContentView : View {

    @State var test:String = "xxx"
    @State var isPlaying:Bool = false
    @State var testDate:Date = Date()
    @State var testPoint:Float = 0.1
    @State var profile:Profile = Profile.default
    
    var body: some View {
        VStack(alignment:.center) {
            // textfiled
            TextfiledView(name: self.$test)
            HStack{
                
                Text("start")
                
                Divider().frame(height:40)
                
                // text
                Text(self.test)
                    .font(.largeTitle) // Font
                
            }
            
            
            
            Image(systemName: "play.circle")
            
            Button(action: {
                //
                self.isPlaying.toggle();
            }) {
                Text("clic kme")
            }
            
            PresentationButton(destination: DetailView(profile: .constant(.default))) {
                Image(systemName: "person.crop.circle")
                    .imageScale(.large)
            }
            
            EditButton()
            
//            DatePicker(self.$testDate) {
//                Text("xxx")
//            }
            
            Toggle(isOn: self.$isPlaying) {
                Text("Switch")
            }
            
            Slider(value: self.$testPoint)
            
            
            /* not work  lack of StperStyle
             Stepper(onIncrement: {
             self.testPoint = self.testPoint + Float(0.1)
             }, onDecrement: {
             self.testPoint = self.testPoint - Float(0.1)
             }) {
             Text("")
             }
             */
//            VStack(alignment: .leading, spacing: 20) {
//                Text("Scroll")
                ScrollView(isScrollEnabled: true, alwaysBounceHorizontal: true, alwaysBounceVertical: false, showsHorizontalIndicator: true, showsVerticalIndicator: false) {
                    //
                    HStack(alignment:.top) {
                        
                        DetailView(profile: .constant(.default)).frame(width:300)
                        DetailView(profile: .constant(.default)).frame(width:300)
                    }
                    }.frame(height:100)
//            }
            
            
             NavigationView {
             List {
             ForEach(0 ... 2) { f in
             HStack {
             Text("row")
             Spacer()
             NavigationButton(destination: DetailView(profile: .constant(.default))) {
             Text("")
             }
             }
             }
             
             }
             .navigationBarTitle(Text("Featured"),  displayMode: .inline)
             }

           
            
            
        }
    }
    

    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
