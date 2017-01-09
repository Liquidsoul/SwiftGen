//
// SwiftGen
// Copyright (c) 2015 Olivier Halligon
// MIT Licence
//

import XCTest
import StencilSwiftKit
import SwiftGenKit
import PathKit

/**
 * Important: In order for the "*.xcassets" files in fixtures/ to be copied as-is in the test bundle
 * (as opposed to being compiled when the test bundle is compiled), a custom "Build Rule" has been added to the target.
 * See Project -> Target "UnitTests" -> Build Rules -> « Files "*.xccassets" using PBXCp »
 */

class ImagesTests: XCTestCase {

  func testEmpty() {
    let parser = AssetsCatalogParser()

    let template = SwiftTemplate(templateString: Fixtures.template(for: "images-default.stencil"), environment: stencilSwiftEnvironment())
    let result = try! template.render(parser.stencilContext())

    let expected = Fixtures.output(for: "Empty.swift.out", sub: .images)
    XCTDiffStrings(result, expected)
  }

  func testFileWithDefaults() {
    let parser = AssetsCatalogParser()
    parser.parseCatalog(at: Fixtures.path(for: "Images.xcassets", sub: .images))

    let template = SwiftTemplate(templateString: Fixtures.template(for: "images-default.stencil"), environment: stencilSwiftEnvironment())
    let result = try! template.render(parser.stencilContext())

    let expected = Fixtures.output(for: "File-Default.swift.out", sub: .images)
    XCTDiffStrings(result, expected)
  }

  func testFileWithSwift3() {
    let parser = AssetsCatalogParser()
    parser.parseCatalog(at: Fixtures.path(for: "Images.xcassets", sub: .images))

    let template = SwiftTemplate(templateString: Fixtures.template(for: "images-swift3.stencil"), environment: stencilSwiftEnvironment())
    let result = try! template.render(parser.stencilContext())

    let expected = Fixtures.output(for: "File-Swift3.swift.out", sub: .images)
    XCTDiffStrings(result, expected)
  }

  func testFileWithAllValuesTemplate() {
    let parser = AssetsCatalogParser()
    parser.parseCatalog(at: Fixtures.path(for: "Images.xcassets", sub: .images))

    let template = SwiftTemplate(templateString: Fixtures.template(for: "images-allvalues.stencil"), environment: stencilSwiftEnvironment())
    let result = try! template.render(parser.stencilContext())

    let expected = Fixtures.output(for: "File-AllValues.swift.out", sub: .images)
    XCTDiffStrings(result, expected)
  }

  func testFileWithCustomName() {
    let parser = AssetsCatalogParser()
    parser.parseCatalog(at: Fixtures.path(for: "Images.xcassets", sub: .images))

    let template = SwiftTemplate(templateString: Fixtures.template(for: "images-default.stencil"), environment: stencilSwiftEnvironment())
    let result = try! template.render(parser.stencilContext(enumName: "XCTImages"))

    let expected = Fixtures.output(for: "File-CustomName.swift.out", sub: .images)
    XCTDiffStrings(result, expected)
  }

  func testFileWithDotSyntax() {
    let parser = AssetsCatalogParser()
    parser.parseCatalog(at: Fixtures.path(for: "Images.xcassets", sub: .images))

    let template = SwiftTemplate(templateString: Fixtures.template(for: "images-dot-syntax.stencil"), environment: stencilSwiftEnvironment())
    let result = try! template.render(parser.stencilContext())

    let expected = Fixtures.output(for: "File-Dot-Syntax.swift.out", sub: .images)
    XCTDiffStrings(result, expected)
  }

  func testFileWithDotSyntaxSwift3() {
    let parser = AssetsCatalogParser()
    parser.parseCatalog(at: Fixtures.path(for: "Images.xcassets", sub: .images))

    let template = SwiftTemplate(templateString: Fixtures.template(for: "images-dot-syntax-swift3.stencil"), environment: stencilSwiftEnvironment())
    let result = try! template.render(parser.stencilContext())

    let expected = Fixtures.output(for: "File-Dot-Syntax-Swift3.swift.out", sub: .images)
    XCTDiffStrings(result, expected)
  }
}
