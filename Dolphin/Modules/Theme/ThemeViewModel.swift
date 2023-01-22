//
//  设置主题颜色视图模型
//  Created by wangxiang4 on 2022/11/29.
//  Copyright © 2022 dolphin-community. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import RxDataSources

class ThemeViewModel: ViewModel, ViewModelType {

    struct Input {
        let refresh: Observable<Void>
        let selection: Driver<ThemeCellViewModel>
    }

    struct Output {
        let items: Driver<[ThemeCellViewModel]>
        let selected: Driver<ThemeCellViewModel>
    }

    func transform(input: Input) -> Output {

        let elements = input.refresh
            .map { ColorTheme.allValues }
            .map { $0.map { ThemeCellViewModel(with: $0) } }
            .asDriver(onErrorJustReturn: [])

        let selected = input.selection

        selected.drive(onNext: { (cellViewModel) in
            let color = cellViewModel.theme
            let theme = ThemeType.currentTheme().withColor(color: color)
            themeService.switch(theme)
        }).disposed(by: rx.disposeBag)

        return Output(items: elements, selected: selected)
    }
}
