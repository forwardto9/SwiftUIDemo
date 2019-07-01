//
//  PresentationsUI.swift
//  testswiftUI
//
//  Created by uwei on 2019/6/27.
//  Copyright © 2019 TEG of Tencent. All rights reserved.
//

import SwiftUI

struct PresentationsUI : View {
    
    @State var isShowAlter = false
    @State var isShowActionSheet = false
    @State var message:String = "hi presentation"
    @State var isShowModel = false
    @State var isShowPop = false
    
    var sheet: ActionSheet {
        ActionSheet(
            title: Text("Action"),
            message: Text("Quote mark"),
            buttons: [
                .default(Text("Action 1"), onTrigger: {
                    self.isShowActionSheet = false
                    // logic
        }),
                .default(Text("Action 2"), onTrigger: {
                    self.isShowActionSheet = false
                    // logic
                }),
                .destructive(Text("Action 3"), onTrigger: {
                    self.isShowActionSheet = false
                }),
                .cancel({
                    self.isShowActionSheet = false
                })
            ]
        )
    }
    
    var modelView:Modal {
        Modal(ContentView()) {
            self.message = "dismiss from model"
            self.isShowModel = false
        }
    }
    
    var popView:Popover {
//        Popover(content: ContentView()) {
//            self.message = "dissmiss from pop"
//            self.isShowPop = false
//        }
        Popover(content: OringeView(), targetPoint: UnitPoint(x: 0.5, y: 0.5), popoverArrowEdge:.leading) {
                        self.message = "dissmiss from pop"
                        self.isShowPop = false
        }
    }
    
    var body: some View {
        VStack {
            Text(self.message)
            Button(action: {
                //
                self.isShowAlter = true
            }) {
                Text("Alert")
                }
                .presentation(self.$isShowAlter) { () -> Alert in
                    Alert(title: Text("Title"), message: Text("message"), dismissButton: Alert.Button.cancel())
            }
            
            
            
            
            Button(action: {
                self.isShowActionSheet = true
            }) {
                Text("ActionSheet")
                }
            .presentation(self.isShowActionSheet ? sheet : nil)
            
            
            Button(action: {
                self.isShowModel = true
            }) {
                Text("Model")
            }
                .presentation(self.isShowModel ? modelView : nil)
            
            
            Button(action: {
                self.isShowPop = true
            }) {
                Text("Pop")
            }
                .background(Color.yellow)
                .presentation(self.isShowPop ? popView : nil)
            
            
            
            
            
            
        }
        
    }
}


#if DEBUG
struct PresentationsUI_Previews : PreviewProvider {
    static var previews: some View {
        PresentationsUI()
    }
}
#endif
