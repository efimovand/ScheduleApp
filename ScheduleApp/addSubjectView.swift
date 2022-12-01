//
//  addSubjectView.swift
//  ScheduleApp
//
//  Created by Андрей Ефимов on 01.12.2022.
//

import SwiftUI

struct addSubjectView: View {
    
    @State var name: String = ""
    @State var teacher: String = ""
    
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
                    
                    Rectangle()
                        .foregroundColor(Color("backgroundColor"))
                        .frame(width: .infinity, height: 362)
                    
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
                            
                            TextField("Преподаватель", text: $name)
                                .font(.system(size: 20, weight: .regular))
                                .padding(.leading, 85)
                        }.frame(width: 310, height: 37)
                            .padding(.vertical, 7)
                        
                        HStack{
                            
                            VStack{ // Room + Type
                                
                                HStack{ // Room
                                    //
                                }
                                
                                ZStack{ // Type
                                    RoundedRectangle(cornerRadius: 40)
                                        .foregroundColor(Color("subjectBackgroundColor"))
                                        .frame(width: 142, height: 37)
                                    
                                    //
                                }
                            }
                            
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
                                        HStack{ // Start Time
                                            Text("начало")
                                                .foregroundColor(Color("addSubjectTimeTextColor"))
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                        
                                        Rectangle() // Divider
                                            .foregroundColor(Color("addSubjectTimeDivider"))
                                            .frame(width: 140, height: 1)
                                        
                                        HStack{ // End Time
                                            Text("конец")
                                                .foregroundColor(Color("addSubjectTimeTextColor"))
                                                .font(.system(size: 14, weight: .regular))
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
                        .padding(.vertical, 15)
                    
                }
                
                Rectangle() // Bottom Divider
                    .foregroundColor(Color("addSubjectDividers"))
                    .frame(width: .infinity, height: 1)
            }
            
            Spacer()
            
        }.ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("subjectBackgroundColor"))
        
    }
    
}


struct addSubjectView_Previews: PreviewProvider {
    static var previews: some View {
        addSubjectView()
    }
}
