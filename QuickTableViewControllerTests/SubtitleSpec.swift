//
//  SubtitleSpec.swift
//  QuickTableViewControllerTests
//
//  Created by Ben on 28/10/2015.
//  Copyright © 2015 bcylin.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Nimble
import Quick
import QuickTableViewController

class SubtitleSpec: QuickSpec {

  override func spec() {
    describe("subtitle style") {
      it("should return the descriptive name of the style") {
        expect(Subtitle.none.style) == "Subtitle.None"
        expect(Subtitle.belowTitle("text").style) == "Subtitle.BelowTitle"
        expect(Subtitle.rightAligned("text").style) == "Subtitle.RightAligned"
        expect(Subtitle.leftAligned("text").style) == "Subtitle.LeftAligned"
      }
    }

    describe("associtated value") {
      let none = Subtitle.none
      let belowTitle = Subtitle.belowTitle("text")
      let rightAligned = Subtitle.rightAligned("text")
      let leftAligned = Subtitle.leftAligned("text")

      it("should return the associated text") {
        expect(none.text).to(beNil())
        expect(belowTitle.text) == "text"
        expect(rightAligned.text) == "text"
        expect(leftAligned.text) == "text"
      }
    }

    describe("equatable") {
      context(".None") {
        it("should be equal when both are .None") {
          let a = Subtitle.none
          let b = Subtitle.none
          expect(a) == b
        }
      }

      context(".BelowTitle") {
        let a = Subtitle.belowTitle("Same")
        let b = Subtitle.belowTitle("Same")
        let c = Subtitle.belowTitle("Different")
        let d = Subtitle.rightAligned("Same")
        let e = Subtitle.none

        it("should be equal only when type and associated value match") {
          expect(a) == b
          expect(a) != c
          expect(a) != d
          expect(a) != e
        }
      }

      context(".RightAligned") {
        let a = Subtitle.rightAligned("Same")
        let b = Subtitle.rightAligned("Same")
        let c = Subtitle.rightAligned("Different")
        let d = Subtitle.leftAligned("Same")
        let e = Subtitle.none

        it("should be equal only when type and associated value match") {
          expect(a) == b
          expect(a) != c
          expect(a) != d
          expect(a) != e
        }
      }

      context(".LeftAligned") {
        let a = Subtitle.leftAligned("Same")
        let b = Subtitle.leftAligned("Same")
        let c = Subtitle.leftAligned("Different")
        let d = Subtitle.belowTitle("Same")
        let e = Subtitle.none

        it("should be equal only when type and associated value match") {
          expect(a) == b
          expect(a) != c
          expect(a) != d
          expect(a) != e
        }
      }
    }
  }

}
