//
//  用户模型转换测试
//  Created by wangxiang4 on 2022/12/5.
//  Copyright © 2022 dolphin-community. All rights reserved.
//

import Quick
import Nimble
@testable import Dolphin

class UserTests: QuickSpec {

    override func spec() {

        let name = "admin"
        let password = "123456"

        describe("Test from JSON Mapper") {
            it("User") {
                let data: [String: Any] = [ "name": name, "password": password ]
                let user = User(JSON: data)

                expect(user?.name) == login
                expect(user?.password) == name
        
            }
        }
        
    }
}
