//
//  subjectView.swift
//  ScheduleApp
//
//  Created by Андрей Ефимов on 01.12.2022.
//

import SwiftUI

struct subjectView: View {
    
    var body: some View {
        
        VStack{
            
            Subject(name: "Программирование", teacher: "Иванов Иван Иванович", room: "426", type: 1, startTime: "8:20", endTime: "9:50", priority: 0)
            
            Subject(name: "Дискретная алгебра", teacher: "Ефимов Андрей Андреевич", room: "312", type: 2, startTime: "10:00", endTime: "11:35", priority: 1)
            
            Subject(name: "Физкультура", teacher: "Антонова Антонина Антоновна", room: "стадион", type: 0, startTime: "12:05", endTime: "13:40", priority: 2)
            
        }
        
    }
    
}


struct Subject: View {
    
    let backgroundColor: Color = Color("subjectBackgroundColor")
    let secondTextColor: Color = Color("subjectSecondTextColor")
    
    let subjectHeight: CGFloat = 130
    
    var name: String
    var teacher: String
    var room: String
    var type: Int // 0 - null, 1 - lecture, 2 - practice
    var startTime: String
    var endTime: String
    var priority: Int // 0 - null, 1 - yellow, 2 - red
    
    var typeString: String = ""
    var priorityPicture: String = ""
    
    let yellowAlarm = "⚠️"
    let redAlarm = "🛑"
    
    init(name: String, teacher: String, room: String, type: Int, startTime: String, endTime: String, priority: Int) {
            self.name = name
            self.teacher = teacher
            self.room = room
            self.type = type
            self.startTime = startTime
            self.endTime = endTime
            self.priority = priority
        
            if (priority == 1) {
                self.priorityPicture = yellowAlarm
            }
            else if (priority == 2) {
                self.priorityPicture = redAlarm
            }
        
            if (type == 1) {
                self.typeString = "лекция"
            }
            else if (type == 2) {
                self.typeString = "практика"
            }
        }
    
    var body: some View {
        
        ZStack{
            
            Rectangle()
                .foregroundColor(backgroundColor)
                .frame(width: .infinity, height: subjectHeight)
            
            HStack{
                
                VStack(alignment: .leading, spacing: 3){
                    
                    Text(name + "  " + priorityPicture)
                        .foregroundColor(Color.white)
                        .font(.system(size: 24, weight: .regular))
                        .onAppear(perform: {
                            
                        })
                    
                    Text(teacher)
                        .foregroundColor(secondTextColor)
                        .font(.system(size: 15, weight: .regular))
                    
                    Text(room.isInt ? "каб. " + room : room)
                        .foregroundColor(secondTextColor)
                        .font(.system(size: 15, weight: .regular))
                    
                }.padding(.leading, 40)
                    .padding(.bottom, 40)
                
                Spacer()
                
                VStack(alignment: .trailing){
                    
                    VStack(spacing: 5){
                        Text(startTime)
                            .foregroundColor(Color.white)
                            .font(.system(size: 15, weight: .regular))
                        
                        Text(endTime)
                            .foregroundColor(Color.white)
                            .font(.system(size: 15, weight: .regular))
                    }.padding(.trailing, 3)
                    
                    Text(typeString)
                        .foregroundColor(secondTextColor)
                        .font(.system(size: 14, weight: .regular))
                        .offset(y: 25)
                    
                }.padding(.trailing, 5)
                    .padding(.top, 10)
                
            }
            
        }
        
    }
    
}


struct subjectView_Previews: PreviewProvider {
    static var previews: some View {
        subjectView()
    }
}
