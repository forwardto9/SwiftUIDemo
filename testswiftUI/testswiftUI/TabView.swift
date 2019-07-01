//
//  TabView.swift
//  testswiftUI
//
//  Created by uwei on 2019/6/27.
//  Copyright © 2019 TEG of Tencent. All rights reserved.
//

import SwiftUI

struct TabView : View {
    
    @State var tabIndex: Int = 0
    
    var body: some View {
        TabbedView(selection: self.$tabIndex) {
            Text("Hello Tab1!").tabItemLabel(Text("item1")).tag(0)
            Text("Hello Tab2!").tabItemLabel(Text("item2")).tag(1)
            ContentView().tabItemLabel(
                VStack {
                    Image(systemName: "play.circle")// not working
                    Text("Home")
                }
            ).tag(3)
        }
        
    }
}

#if DEBUG
struct TabView_Previews : PreviewProvider {
    static var previews: some View {
        TabView()
    }
}
#endif
