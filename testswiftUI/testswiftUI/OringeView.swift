//
//  OringeView.swift
//  testswiftUI
//
//  Created by uwei on 2019/6/28.
//  Copyright © 2019 TEG of Tencent. All rights reserved.
//

import SwiftUI

struct OringeView : View {
    var body: some View {
        ZStack
            {
                Color.orange.edgesIgnoringSafeArea(.all)
        }
    }
}

#if DEBUG
struct OringeView_Previews : PreviewProvider {
    static var previews: some View {
        OringeView()
    }
}
#endif
