import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setup()
        return true
    }
    
    func setup() {
        let usersVC = UsersVC()
        let postsVC = PostsVC()
        let navUsersVC = UINavigationController(rootViewController: usersVC)
        let navPostsVC = UINavigationController(rootViewController: postsVC)
        let tabBarController = UITabBarController()
        let allVC = [navUsersVC, navPostsVC]
        tabBarController.setViewControllers(allVC, animated: true)
        let usersItem = UITabBarItem(title: "Users", image: .actions, tag: 0)
        let postsItem = UITabBarItem(title: "Posts", image: .actions, tag: 1)
        navUsersVC.tabBarItem = usersItem
        navPostsVC.tabBarItem = postsItem
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}

