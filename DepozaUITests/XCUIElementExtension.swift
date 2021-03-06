//
//  XCUIElementExtension.swift
//  Tinder
//
//  Created by Igor Dorovskikh on 6/16/16.
//  Copyright © 2013 - 2016 Tinder, Inc., ALL RIGHTS RESERVED
//

import XCTest

private let defaultTimeoutInSeconds = 60.0

extension XCUIElement {
    func waitToExist() -> XCUIElement {
        let doesElementExist: () -> Bool = {
            return self.exists
        }
        waitFor(doesElementExist, failureMessage: "Timed out waiting for element to exist.")
        return self
    }
    
    private func waitFor(_ expression: () -> Bool, failureMessage: String) {
        let startTime = NSDate.timeIntervalSinceReferenceDate
        
        while !expression() {
            if NSDate.timeIntervalSinceReferenceDate - startTime > defaultTimeoutInSeconds {
                NSException(name: NSExceptionName(rawValue: "Timeout"), reason: failureMessage, userInfo: nil).raise()
            }
            CFRunLoopRunInMode(CFRunLoopMode.defaultMode, 0.1, true)
        }
    }
<<<<<<< HEAD

    func forceTapElement() {
        if self.isHittable {
            self.tap()
        }
        else { let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx:0.0, dy: 0.0))
            coordinate.tap()
        }
    }

=======
>>>>>>> upstream/day4
}
