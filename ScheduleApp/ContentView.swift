//
//  ContentView.swift
//  ScheduleApp
//
//  Created by Андрей Ефимов on 30.11.2022.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    @State var weekdays: [String] = ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб"]
    
    var body: some View {
        
        VStack{
            
            // Header
            ZStack {
                
                // Header Background
                Rectangle()
                    .foregroundColor(Color("headerColor"))
                    .frame(maxWidth: .infinity, maxHeight: 105)
                
                // Week Bar
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color.white)
                        .frame(width: 340, height: 39)
                    
                    HStack {
                        
                        // Days
                        ForEach(0..<weekdays.count) {
                            Text(weekdays[$0])
                                .font(.system(size: 24, weight: .regular))
                                .padding(.horizontal, 4)
                            
                            // Lines
                            if ($0 < weekdays.count - 1) {
                                Rectangle()
                                    .foregroundColor(Color("headerColor"))
                                    .frame(width: 2, height: 39)
                            }
                        }
                    }
                    
                }
                .offset(y: 20)
                
            }
            
            // Subjects List
            VStack{
                
                Subject(name: "Программирование", teacher: "Иванов Иван Иванович", room: "426", type: 1, startTime: "8:20", endTime: "9:50", priority: 0)
                
                Subject(name: "Дискретная алгебра", teacher: "Ефимов Андрей Андреевич", room: "312", type: 2, startTime: "10:00", endTime: "11:35", priority: 1)
                
                Subject(name: "Физкультура", teacher: "Антонова Антонина Антоновна", room: "стадион", type: 0, startTime: "12:05", endTime: "13:40", priority: 2)
            }
            
            Spacer()
            
        }.ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("backgroundColor"))
            .overlay(Button(action: { // Add Subject Button
                //
            }) {
                Circle()
                    .foregroundColor(Color("headerColor"))
                    .frame(width: 50, height: 50)
                    .overlay(Text("+").foregroundColor(Color.white).font(.system(size: 48, weight: .regular)).frame(width: 50, height: 50, alignment: .bottom))
                    .offset(y: 350)
            })
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
