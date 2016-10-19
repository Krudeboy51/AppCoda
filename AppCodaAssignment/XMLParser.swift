//
//  XMLParser.swift
//  AppCodaAssignment
//
//  Created by Kory E King on 10/19/16.
//  Copyright © 2016 Kory E King. All rights reserved.
//

import UIKit

@objc protocol XMLParserDelegate{
    func parsingWasFinished()
}

class XMLParser: NSObject, NSXMLParserDelegate {
    
    var arrParsedData = [Dictionary<String,String>]()
    var currentDataDicionary = Dictionary<String, String>()
    var currentElement = ""
    var foundCharacters = ""
    var delegate : XMLParserDelegate?
    
    func startParsingWithContentOfURL(rssURL: NSURL){
        let parser = NSXMLParser(contentsOfURL: rssURL)!
        parser.delegate = self
        parser.parse()
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]){
        
        currentElement = elementName
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        if (currentElement == "title" && currentElement != "Appcoda") || currentElement == "link" || currentElement == "pubDate"{
            foundCharacters += string
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if !foundCharacters.isEmpty{
            if elementName == "link"{
             foundCharacters = (foundCharacters as NSString).substringFromIndex(3)
            }
            
            currentDataDicionary[currentElement] = foundCharacters
            
            foundCharacters = ""
            
            if currentElement == "pubDate" {
                arrParsedData.append(currentDataDicionary)
            }
        }
    }
    
    
    func parserDidEndDocument(parser: NSXMLParser) {
        delegate?.parsingWasFinished()
    }
    
    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
        print(parseError.description)
    }
    
    func parser(parser: NSXMLParser, validationErrorOccurred validationError: NSError) {
        print(validationError.description)
    }

}
