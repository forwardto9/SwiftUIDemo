//
//  SectionView.swift
//  testswiftUI
//
//  Created by uwei on 2019/6/28.
//  Copyright © 2019 TEG of Tencent. All rights reserved.
//

import SwiftUI


struct TestData: Identifiable {
    var id = UUID()
    
    var title:String
    var items:[String]
}

struct SectionView : View {
    let mygroups = [
        TestData(title: "Numbers", items: ["1","2","3"]),
        TestData(title: "Letters", items: ["A","B","C"]),
        TestData(title: "Symbols", items: ["€","%","&"])
    ]
    
    var body: some View {
         
        NavigationView {
            List {
                ForEach(mygroups) { gr in
                    Section(header: Text(gr.title),
                            footer: Text("...footer...") ) {
                                ForEach(gr.items.identified(by: \.self)) { item in
                                    Text(item)
                                }
                    }
                }
            }
            .navigationBarTitle(Text("Table"), displayMode: .inline)
        }
    }
}

#if DEBUG
struct SectionView_Previews : PreviewProvider {
    static var previews: some View {
        SectionView()
    }
}
#endif
