//
//  SwiftGen
//  Created by Peter Livesey on 9/16/16.
//  Copyright (c) 2017 Olivier Halligon
//  MIT License
//

import Commander
import PathKit
import StencilSwiftKit
import SwiftGenKit

let jsonCommand = command(
  outputOption,
  templateOption(prefix: "json"),
  templatePathOption,
  Argument<Path>("FILE", description: "JSON to parse", validator: fileExists)
) { output, templateName, templatePath, path in
  let parser = JSONFileParser()

  do {
    try parser.parseFile(path: path)
    let templateRealPath = try findTemplate(prefix: "json",
                                            templateShortName: templateName,
                                            templateFullPath: templatePath)
    let template = try StencilSwiftTemplate(templateString: templateRealPath.read(),
                                            environment: stencilSwiftEnvironment())
    let context = parser.stencilContext()
    let rendered = try template.render(context)
    output.write(content: rendered, onlyIfChanged: true)
  } catch let error as NSError {
    printError(string: "error: \(error.localizedDescription)")
  }
}
