//
//  GroupView.swift
//  testswiftUI
//
//  Created by uwei on 2019/6/28.
//  Copyright © 2019 TEG of Tencent. All rights reserved.
//

import SwiftUI

struct GroupView : View {
    var body: some View {
        VStack{
            Group {
                Text("Text").frame(width:100)
                .background(Color.red)
                Text("xxxx")
                .background(Color.blue)
                }
                .frame(width:50, height: 100)
            .background(Color.yellow)
            
        }
            .background(Color.orange)
        
    }
}

#if DEBUG
struct GroupView_Previews : PreviewProvider {
    static var previews: some View {
        GroupView()
    }
}
#endif
