//
//  PageViewController.swift
//  1
//
//  Created by egor aleksandrovich on 25.12.2022.
//

import UIKit

class PageViewController: UIPageViewController {
    
    let presentScreenContent = [
        "Первая страница презинтации, рассказывающая о том, что наше приложение из себя представялет",
        "Вторая страница презинтации, рассказывает о какой-то удобной фишке приложения",
        "Третья страница перзинтации тоже рассказывает о чем-то очень интересном",
        "Ну и наконец последняя стриница перзинтации с напутствием в добрый путь =)",
        ""
    ]
    
    let emojiArray = ["😉","🫥","😲","🫶",""]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self

        if let contentViewController = showViewControllerAtIndex(0) {
            setViewControllers([contentViewController], direction: .forward, animated: true)
        }
    }
    
    func showViewControllerAtIndex(_ index: Int) -> ContentViewController? {
        
        guard index >= 0 else { return nil }
        guard index < presentScreenContent.count else {
            let userDefoults = UserDefaults.standard
            userDefoults.set(true, forKey: "presentationWasViewd")
            dismiss(animated: true)
            return nil
        }
        guard let contentViewController = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as? ContentViewController else { return nil }
        contentViewController.presentText = presentScreenContent[index]
        contentViewController.emoji = emojiArray[index]
        contentViewController.curentPage = index
        contentViewController.numberOfPage = presentScreenContent.count
        
        return contentViewController
    }

}

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var pageNumber = (viewController as! ContentViewController).curentPage
        pageNumber -= 1
        
        return showViewControllerAtIndex(pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var pageNumber = (viewController as! ContentViewController).curentPage
        pageNumber += 1
        
        return showViewControllerAtIndex(pageNumber)
    }
    
}
