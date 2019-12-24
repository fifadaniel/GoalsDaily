//
//  ViewController2.swift
//  ArtOfMovement
//
//  Created by Hyeong Kyun Park on 12/23/19.
//  Copyright © 2019 fifadaniel. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var randomBackground: UIImageView!
    @IBOutlet weak var quoteBox: UIView!
    @IBOutlet weak var theQuote: UILabel!
    @IBOutlet weak var quotePerson: UILabel!
    
    var quoteList = ["Act as if what you do\n makes a difference. \nIt does.":"William James",
                                      "Success is not final,\n failure is not fatal\n: it is the courage\n to continue that counts.\n":"Winston Churchill",
                                      "Never bend your head.\n Always hold it high.\n Look the world straight\n in the eye.":"Helen Keller",
                                      "What you get by \nachieving your \ngoals is not as \nimportant as what you\n become by achieving \nyour goals.":"Zig Ziglar",
                                      "Believe you can \nand you're halfway\n there.":"Theodore Roosevelt",
                                      "When you have a dream,\n you've got to grab\n it and never \nlet go.":"Carol Burnett",
                                      "I can't change the\n direction of the \nwind, but I can \nadjust my sails \nto always reach \nmy destination.":"Jimmy Dean",
                                      "No matter what \nyou're going through,\n there's a light at\n the end of the \ntunnel.":"Demi Lovato",
                                      "It is our attitude\n at the beginning of\n a difficult task which,\n more than anything else,\n will affect its \nsuccessful outcome.":"William James",
                                      "Life is like riding \na bicycle. To keep your \nbalance, you must \nkeep moving.":"Albert Einstein",
                                      "Just don't give up \ntrying to do what \nyou really want to \ndo. Where there is \nlove and inspiration, \nI don't think you can \ngo wrong.":"Ella Fitzgerald",
                                      "Limit your \("always")\n and your \("nevers.")":"Amy Poehler",
                                      "Nothing is impossible.\n The word itself says\n \("I'm possible!")":"Audrey Hepburn",
                                      "You are never too\n old to set another \ngoal or to dream a\n new dream.":"C.S. Lewis",
                                      "Try to be a rainbow\n in someone else's\n cloud.":"Maya Angelou",
                                      "You do not find\n the happy life. \nYou make it.":"Camilla Eyring Kimball",
                                      "Inspiration comes from \nwithin yourself. One has\n to be positive. When\n you're positive, good \nthings happen.":"Deep Roy",
                                      "Sometimes you will \nnever know the \nvalue of a moment, \nuntil it becomes a\n memory.":"Dr. Seuss",
                                      "The most wasted of \ndays is one without \nlaughter.":"E.E. Cummings",
                                      "You must do the \nthings you think \nyou cannot do.":"Eleanor Roosevelt",
                                      "It isn't where \nyou came from. It's where \nyou're going \nthat counts.":"Ella Fitzgerald",
                                      "It is never too late \nto be what you might \nhave been.":"George Eliot",
                                      "Stay close to anything \nthat makes you glad you \nare alive.":"Hafez",
                                      "You get what you \ngive.":"Jennifer Lopez",
                                      "Some people look for a \nbeautiful place. Others\n make a place beautiful.":"Hazrat Inayat Khan",
                                      "Happiness often sneaks \nin through a door you \ndidn't know you left \nopen.":"John Barrymore",
                                      "We must be willing \nto let go of the life we planned \nso as to have the life \nthat is waiting \nfor us.":"Joseph Campbell",
                                      "Happiness is not by \nchance, but by \nchoice.":"Jim Rohn",
                                      "Life changes very \nquickly, in a very \npositive way, if \nyou let it.":"Lindsey Vonn",
                                      "Keep your face to \nthe sunshine and you cannot \nsee a shadow.":"Helen Keller",
                                      "Never limit yourself \nbecause of others’ \nlimited imagination; \nnever limit others because of \nyour own limited \nimagination.":"Mae Jemison",
                                      "Be the change that \nyou wish to see \nin the world.":"Mahatma Gandhi",
                                      "Let us make our future \nnow, and let us make \nour dreams tomorrow's \nreality.":"Malaya Yousafzai",
                                      "You don't always need \na plan. Sometimes you \njust need to breathe, \ntrust, let go, and see \nwhat happens.":"Mandy Hale",
                                      "If I cannot do \ngreat things, I can do \nsmall things in a \ngreat way.":"MLK Jr.",
                                      "My mission in life \nis not merely to \nsurvive, but \nto thrive.":"Maya Angelou",
                                      "You are enough \njust as you are.":"Meghan Markle",
                                      "The bad news is \ntime flies. The good news \nis you're the pilot.":"Michael Altschuler",
                                      "Spread love everywhere \nyou go.":"Mother Teresa",
                                      "Don't wait. The time \nwill never be just \nright.":"Napoleon Hill",
                                      "Life has got all those \ntwists and turns. You've \ngot to hold on tight and \noff you go.":"Nicole Kidman",
                                      "If you look at what \nyou have in life, you'll \nalways have more.":"Oprah Winfrey",
                                      "Inspiration is some mysterious \nblessing which happens when \nthe wheels are turning \nsmoothly.":"Quentin Blake",
                                      "With the right kind of \ncoaching and determination you \ncan accomplish anything.":"Reese Witherspoon",
                                      "If you have good thoughts \nthey will shine out of your \nface like sunbeams and you \nwill always look lovely.":"Roald Dahl",
                                      "No matter what people \ntell you, words and ideas \ncan change the world.":"Robin Williams",
                                      "Each person must live \ntheir life as a model \nfor others.":"Rosa Parks",
                                      "A champion is defined not \nby their wins but by how \nthey can recover when they\n fall.":"Serena Williams",
                                      "Motivation comes from \nworking on things we \ncare about.":"Sheryl Sandberg",
                                      "Keep your face always \ntoward the sunshine, and \nshadows will fall behind you.":"Walt Whitman"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        //view.addGestureRecognizer(tap)
        
        //let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        //rightSwipe.direction = UISwipeGestureRecognizer.Direction.right
        //self.view.addGestureRecognizer(rightSwipe)
        
        // UI Customization
        quoteBox.layer.borderWidth = 1.0
        quoteBox.layer.borderColor = UIColor.gray.cgColor
        quoteBox.layer.backgroundColor = UIColor.gray.cgColor
        
        // Randomization
        randomBackground.image = UIImage(named: "\(Int.random(in: 0...5))")
        
        let randVal = Int.random(in: 0...50)
        let theKey = Array(quoteList.keys)[randVal]
        theQuote.text = theKey
        quotePerson.text = quoteList[theKey]

    }
}
