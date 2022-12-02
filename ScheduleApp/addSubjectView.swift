//
//  addSubjectView.swift
//  ScheduleApp
//
//  Created by Андрей Ефимов on 01.12.2022.
//

import SwiftUI

enum type: String, Identifiable, CaseIterable { // Lesson Type Picker
    case lection = "лекция"
    case practice = "практика"
    case null = "-"
    var id: String { self.rawValue }
}


struct addSubjectView: View {
    
    @State var name: String = ""
    @State var teacher: String = ""
    @State var room: String = ""
    
    @State var selectedType = type.lection
    
    @State var selectedStartTime: Date = Date()
    @State var selectedEndTime: Date = Date()
    
    @State private var startTimePickerIsShown = false
    @State private var endTimePickerIsShown = false
    
    var body: some View {
        
        VStack{
            
            // Header
            ZStack {
                
                // Header Background
                Rectangle()
                    .foregroundColor(Color("headerColor"))
                    .frame(maxWidth: .infinity, maxHeight: 105)
                
                // Header Label
                Text("Новое занятие")
                    .foregroundColor(Color.white)
                    .font(.system(size: 32, weight: .medium))
                    .frame(maxWidth: .infinity, maxHeight: 75, alignment: .bottomLeading)
                    .padding(.leading)
                
            }
            
            // Main Set
            VStack(spacing: 0){
                Rectangle() // Top Divider
                    .foregroundColor(Color("addSubjectDividers"))
                    .frame(width: .infinity, height: 1)
                
                // Set
                ZStack{
                    
                    Rectangle() // Set Background
                        .foregroundColor(Color("backgroundColor"))
                        .frame(width: .infinity, height: 367)
                    
                    VStack{
                        
                        ZStack{ // Name
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundColor(Color("subjectBackgroundColor"))
                            
                            TextField("Название", text: $name)
                                .font(.system(size: 20, weight: .regular))
                                .padding(.leading, 125)
                        }.frame(width: 340, height: 45)
                        
                        ZStack{ // Teacher
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundColor(Color("subjectBackgroundColor"))
                            
                            TextField("Преподаватель", text: $teacher)
                                .font(.system(size: 18, weight: .regular))
                                .padding(.leading, 85)
                        }.frame(width: 310, height: 37)
                            .padding(.vertical, 7)
                        
                        HStack{
                            
                            VStack(alignment: .leading, spacing: 13){ // Room + Type
                                
                                HStack(spacing: 7){ // Room + Change Circle
                                    ZStack{ // Room
                                        RoundedRectangle(cornerRadius: 40)
                                            .foregroundColor(Color("subjectBackgroundColor"))
                                            .frame(width: 100, height: 37)
                                        
                                        TextField("Кабинет", text: $room)
                                            .font(.system(size: 16, weight: .regular))
                                            .frame(width: 70, height: 37)
                                            .offset(x: 4)
                                    }
                                    
                                    Button(action: { // Change Circle
                                        // Change Room Type (!)
                                    }) {
                                        Circle()
                                            .foregroundColor(Color("subjectBackgroundColor"))
                                            .frame(width: 32, height: 32)
                                            .overlay(Image("changeRoomType").resizable().frame(width: 12, height: 12).opacity(0.6))
                                    }
                                }
                                
                                ZStack{ // Type
                                    RoundedRectangle(cornerRadius: 40)
                                        .foregroundColor(Color("subjectBackgroundColor"))
                                        .frame(width: 142, height: 37)
                                    
                                    Menu { // Picker
                                        Picker(selection: $selectedType) {
                                            ForEach(type.allCases) { value in
                                                Text(value.rawValue)
                                                    .tag(value)
                                            }
                                        } label: {}
                                    } label: {
                                        Text(selectedType.rawValue)
                                            .foregroundColor(Color("addSubjectTimeTextColor"))
                                            .font(.system(size: 14, weight: .regular))
                                    }.id(selectedType)
                                }
                            }.padding(.top)
                            
                            Spacer()
                            
                            VStack(alignment: .center, spacing: 5){ // Time
                                Text("Время")
                                    .foregroundColor(Color("addSubjectTextColor"))
                                    .font(.system(size: 16, weight: .regular))
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(Color("subjectBackgroundColor"))
                                        .frame(width: 140, height: 80)
                                    
                                    VStack{
                                        HStack(spacing: 35){ // Start Time
                                            Text("начало")
                                                .foregroundColor(Color("addSubjectTimeTextColor"))
                                                .font(.system(size: 14, weight: .regular))
                                                .frame(width: 50, alignment: .leading)
                                            
                                            Button(action: { // Start Time Picker
                                                endTimePickerIsShown = false
                                                startTimePickerIsShown = true
                                            }) {
                                                Text(formateDate(date: selectedStartTime)).foregroundColor(Color("addSubjectTimeTextColor")).font(.system(size: 14, weight: .regular))
                                            }.frame(width: 40, alignment: .trailing)
                                        }
                                        
                                        Rectangle() // Divider
                                            .foregroundColor(Color("addSubjectTimeDivider"))
                                            .frame(width: 140, height: 1)
                                        
                                        HStack(spacing: 35){ // End Time
                                            Text("конец")
                                                .foregroundColor(Color("addSubjectTimeTextColor"))
                                                .font(.system(size: 14, weight: .regular))
                                                .frame(width: 50, alignment: .leading)
                                            
                                            Button(action: { // End Time Picker
                                                startTimePickerIsShown = false
                                                endTimePickerIsShown = true
                                            }) {
                                                Text(formateDate(date: selectedEndTime)).foregroundColor(Color("addSubjectTimeTextColor")).font(.system(size: 14, weight: .regular))
                                            }.frame(width: 40, alignment: .trailing)
                                        }
                                    }
                                }
                            }
                            
                        }.padding(.top, 20)
                        
                        VStack(alignment: .center, spacing: 5){ // Priority
                            Text("Приоритет")
                                .foregroundColor(Color("addSubjectTextColor"))
                                .font(.system(size: 15, weight: .regular))
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 40)
                                    .foregroundColor(Color("subjectBackgroundColor"))
                                
                                HStack(spacing: 3){ // Priority Vars
                                    Text("-")
                                        .foregroundColor(Color("addSubjectTimeTextColor"))
                                        .font(.system(size: 32, weight: .regular))
                                        .frame(width: 45, height: 34, alignment: .bottom)
                                        .offset(x: 4)
                                    
                                    Rectangle()
                                        .foregroundColor(Color("backgroundColor"))
                                        .frame(width: 0.5, height: 37)
                                    
                                    Text("⚠️")
                                        .font(.system(size: 22, weight: .regular))
                                        .frame(width: 45, height: 34, alignment: .center)
                                    
                                    Rectangle()
                                        .foregroundColor(Color("backgroundColor"))
                                        .frame(width: 0.5, height: 37)
                                    
                                    Text("🛑")
                                        .font(.system(size: 22, weight: .regular))
                                        .frame(width: 45, height: 34, alignment: .center)
                                        .offset(x: -2)
                                }
                            }.frame(width: 142, height: 37)
                        }.padding(.top, 25)
                            .frame(maxWidth: 320, alignment: .leading)
                        
                    }.frame(maxWidth: 340)
                        .padding(.vertical, 18)
                    
                }
                
                Rectangle() // Bottom Divider
                    .foregroundColor(Color("addSubjectDividers"))
                    .frame(width: .infinity, height: 1)
            }.padding(.vertical, 5)
            
            Spacer()
            
            // Navigation Buttons
            ZStack{
                RoundedCorners(tl: 35, tr: 35, bl: 0, br: 0)
                    .foregroundColor(Color("headerColor"))
                    .frame(width: .infinity, height: 66)
                
                HStack(spacing: 45){
                    
                    Button(action: { // Next Button
                        // Next Page (!)
                    }) {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(Color.purple)
                            .frame(width: 130, height: 45)
                            .overlay(Text("Далее").foregroundColor(Color.white).font(.system(size: 20, weight: .medium)))
                    }
                    
                    Button(action: { // Cancel Button
                        // Previous Page (!)
                    }) {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(Color("addSubjectCancelButton"))
                            .frame(width: 130, height: 45)
                            .overlay(Text("Отмена").foregroundColor(Color.white).font(.system(size: 20, weight: .medium)))
                    }
                    
                }
            }
            
            // Start/End Time Pickers
            if (startTimePickerIsShown) {
                ZStack{
                    Rectangle()
                        .foregroundColor(Color("subjectBackgroundColor"))
                        .frame(width: .infinity, height: 200, alignment: .leading)
                    
                    DatePicker("", selection: $selectedStartTime, displayedComponents: .hourAndMinute)
                        .datePickerStyle(.wheel)
                        .frame(width: .infinity, height: 200, alignment: .center)
                        .labelsHidden()
                        .opacity(0.5)
                }
            }
            
            if (endTimePickerIsShown) {
                ZStack{
                    Rectangle()
                        .foregroundColor(Color("subjectBackgroundColor"))
                        .frame(width: .infinity, height: 200, alignment: .leading)
                    
                    DatePicker("", selection: $selectedEndTime, displayedComponents: .hourAndMinute)
                        .datePickerStyle(.wheel)
                        .frame(width: .infinity, height: 200, alignment: .center)
                        .labelsHidden()
                        .opacity(0.5)
                }
            }
            
        }.ignoresSafeArea()
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("subjectBackgroundColor"))
            .preferredColorScheme(.dark)
        
    }
    
}


struct addSubjectView_Previews: PreviewProvider {
    static var previews: some View {
        addSubjectView()
    }
}
