//
//  ReservationForm.swift
//  ReservationApp
//
//  Created by Parmesh Mahore on 05/07/23.
//

import SwiftUI

struct ReservationForm: View {
    
    @EnvironmentObject var model: Model
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var restaurant: Restaurant
    @State var party: Int = 1
    @State var name: String = ""
    @State var phone: String = ""
    @State var email: String = ""
    @State var anySpecialRequest: String = ""
    
    @State var selectedDate = Date()
    @State var isValidationFailed = false
    @State var errorMessage = ""
    
    @FocusState var isFocused: Bool
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(restaurant.city).font(.headline).foregroundColor(.black.opacity(0.7))
            
            Text("\(restaurant.neighborhood) - \(restaurant.phoneNumber)")
                .font(.subheadline)
                .font(.custom("", size: 20))
                .foregroundColor(.black.opacity(0.5))
            Divider()
            HStack {
                VStack(alignment: .leading) {
                    Text("PARTY:")
                    TextField(String(party), value: $party, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        .onChange(of: party) { value in
                            if value == 0 {
                                party = 1
                            }
                        }
                }
                DatePicker(selection: $selectedDate, in: Date()..., displayedComponents: [.date, .hourAndMinute]) {
                }.onSubmit {
                    
                }
            }
            Divider()
            Group {
                HStack {
                    Text("NAME:")
                    TextField("Your name...", text: $name)
                }
                Divider()
                HStack {
                    Text("PHONE:")
                    TextField("Your phone number...", text: $phone).keyboardType(.phonePad)
                }
                Divider()
                HStack {
                    Text("E-MAIL:")
                    TextField("Your e-mail...", text: $email).keyboardType(.emailAddress)
                }
                Divider()
                TextField("add any special request (optional)", text: $anySpecialRequest)
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 16)
                    .stroke(.gray.opacity(0.5)))
                Divider()
                
                Button {
                    isValidationFailed = !validationFormV2()
//                    switch errorType {
//                        case .PeopleCannotBeZero:
//                            errorMessage = "People count cannot be Zero"
//                            isValidationFailed = true
//                        case .NameIsEmpty:
//                            errorMessage = "Name is Empty"
//                            isValidationFailed = true
//                        case .NameIsVerySmall:
//                            errorMessage = "Name must have at least 3 characters"
//                            isValidationFailed = true
//                        case .NameContainsSpecialCharacter:
//                            errorMessage = "Name can only contain letters"
//                            isValidationFailed = true
//                        case .PhoneNumberEmpty:
//                            errorMessage = "Phone number is Empty"
//                            isValidationFailed = true
//                        case .EmailIsEmpty:
//                            errorMessage = "Email is Empty"
//                            isValidationFailed = true
//                        case .InvalidEmailFormat:
//                            errorMessage = "Invalid Email Format"
//                            isValidationFailed = true
//                        case .Success:
//                            isValidationFailed = false
//                    }

                } label: {
                    Text("CONFIRM RESERVATION").foregroundColor(.white).padding(10)
                }
                .background(Color.accentColor)
                .cornerRadius(20)
                .alert(isPresented: $isValidationFailed) {
                    Alert(title: Text("ERROR"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
                }
            }
        }
        .padding(EdgeInsets(top: -50, leading: 20, bottom: 0, trailing: 20))
        .onAppear {
            model.displayingReservationForm = true
        }
        .onDisappear {
            model.displayingReservationForm = false
        }
    }
    
    func validationFormV2() -> Bool {
        errorMessage = ""
        var tempMessage: String = ""
        var isValid = true
        tempMessage.append(contentsOf: "Found these errors in the forms:")
        // validate name
        if name.count < 4 || name.containsSpecialCharacter {
            tempMessage.append(contentsOf: "\n\nNames can only contain letters and must have at least 3 characters")
            isValid = false
        }
        
        if phone.isEmpty {
            tempMessage.append(contentsOf: "\n\nThe phone number cannot be blank.")
            isValid = false
        }
        
        if !isValidEmail(email) {
            tempMessage.append(contentsOf: "\n\nThe email is invalid and cannot be blank.")
            isValid = false
        }
        errorMessage = tempMessage
        return isValid
    }
    
    //un-used
    func validateForm() -> ValidationType {
        if party == 0 {
            return ValidationType.PeopleCannotBeZero
        } else if name.isEmpty {
            return ValidationType.NameIsEmpty
        } else if phone.isEmpty {
            return ValidationType.PhoneNumberEmpty
        } else if email.isEmpty {
            return ValidationType.EmailIsEmpty
        } else if !isValidEmail(email) {
            return ValidationType.InvalidEmailFormat
        } else if name.count < 4 {
            return ValidationType.NameIsVerySmall
        } else if name.containsSpecialCharacter {
            return ValidationType.NameContainsSpecialCharacter
        } else {
            return ValidationType.Success
        }
    }
    
}

extension String {
   var containsSpecialCharacter: Bool {
      let regex = ".*[^A-Za-z0-9].*"
      let testString = NSPredicate(format:"SELF MATCHES %@", regex)
      return testString.evaluate(with: self)
   }
}

func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    let result = emailPred.evaluate(with: email)
    return result
}

//un-used
enum ValidationType {
    case PeopleCannotBeZero,
         NameIsEmpty,
         NameIsVerySmall,
         NameContainsSpecialCharacter,
         PhoneNumberEmpty,
         EmailIsEmpty,
         InvalidEmailFormat,
         Success
}

struct ReservationForm_Previews: PreviewProvider {
    static var previews: some View {
        ReservationForm(restaurant: Restaurant(id: UUID(), city: "Bangalore", neighborhood: "Whitefield", phoneNumber: "1234567890"), party: 1)
    }
}
