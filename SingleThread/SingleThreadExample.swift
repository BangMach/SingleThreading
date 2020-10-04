//
//  SingleThreadExample.swift
//  SingleThread
//
//  Created by Mach Dieu Bang on 10/1/20.
//

import SwiftUI

struct SingleThreadExample: View {
    @State var selectedDate = Date()
    var mainThread = DispatchQueue(label: "Main Thread")
    
    var MainThread = DispatchQueue.main
    //--OR--
    var BackGroundThread = DispatchQueue.global()
    
    
    //--With customizable
    var backgroundThread1 = DispatchQueue.global(qos: .userInteractive)
    var backgroundThread2 = DispatchQueue.global(qos: .userInitiated)
    var backgroundThread3 = DispatchQueue.global(qos: .background)
    var backgroundThread4 = DispatchQueue.global(qos: .default)

    
    var queue1 = DispatchQueue(label: "serial Queue",qos: .userInitiated)
    var queue2 = DispatchQueue(label: "Serial Queue",qos: .background)
    var queue3 = DispatchQueue(label: "Serial Queue 2",qos:.default)
    var text:String = ""
    
    var body: some View {
        VStack{
            Button(action: {
                mainThread.sync {
                    print("Print on the main thread")
                    doWork()
                    print("Work on main thread -- Sync-- finish")

                }
            }) {
                Buttons(text: "Main Thread Sync")
            }
            
            
            Button(action: {
                //action
                mainThread.async {
                    print("Print on the main thread async")
                    doWork()
                    print("Work on main thread -- Async-- finish")
                 
                }
            }) {
                Buttons(text: "Main Thread ASync")
            }
         
                Button(action: {
                    //action
                    queue2.async {
                        print("print on userinit queue" )
                        doWork()
                        print("Work on background thread -- User Initiated -- finished")

                        
                    }
                }) {
                    Buttons(text: "Back ground Thread: User initiated")

                }
                
                Button(action: {
                    //action
                    queue2.async {
                    
                        print("print on background queue" )
                        // do work function download 4k video back home()
                        doWork()
                        print("Work on background thread -- Back Ground -- finished")
                    }
                }) {
                    Buttons(text: "Back ground Thread: Back Ground")
                }
            
          
            VStack {
                       DatePicker("", selection: $selectedDate, displayedComponents: .date)
                       Text("Your selected date: \(selectedDate)")
                   }.padding()
            
        }
    }
}


struct Buttons: View {
    var text:String
    var body: some View {
        VStack {
            Text(text)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .frame(width: 200, height: 60)
                .background(
                    ZStack {
                        Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1))
                        
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .foregroundColor(.white)
                            .blur(radius: 4)
                            .offset(x: -8, y: -8)
                        
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9019607843, green: 0.9294117647, blue: 0.9882352941, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                            .padding(2)
                            .blur(radius: 2)
                    }
                )
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .shadow(color: Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: 20, y: 20)
                .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
                  
        }
        .frame(maxWidth: 250, maxHeight: 100)
        .edgesIgnoringSafeArea(.all)
    }
}

func doWork(){
    for i in 0...1000000 {
        print("pixelzied jargant"+String(i))
    }
    print("work ended")
}
struct SingleThreadExample_Previews: PreviewProvider {
    static var previews: some View {
        SingleThreadExample()
    }
}
