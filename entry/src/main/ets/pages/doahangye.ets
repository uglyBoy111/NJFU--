//导入课程表数据
import {navItem02} from './TimeTable'
//导入校历数据
import {navItem01} from'./xiaoli'
//现在是第几节课
import { now_order } from './My_Time'
//现在是周几
import {now_day} from'./My_Time'
//现在是第几周
import {now_week}from'./My_Time'
//课程类
import {Classrooms, Course}from'./My_Lessons'
//课程对象数组
import {courses}from'./My_Lessons'

@Entry
@Component
struct Doahangye {
  //准备状态，存储激活索引
  @State selectIndex:number = 0
  //预设课程表区域
  @State i: Number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
  @State lessons: string[] = ['第一节课', '第二节课', '第三节课', '第四节课', '第五节课', '第六节课', '第七节课', '第八节课', '第九节课', '第十节课', '第十一节课']
  @State timeSlots: string[] = ['08:00-08:50', '09:00-09:50', '10:10-11:00', '11:10-12:00', '14:00-14:50', '15:00-15:50', '16:10-17:00', '17:10-18:00', '18:30-19:20', '19:30-20:20', '20:30-21:20']
  @State courseList: Course[] = courses
  @State daysOfWeek: string[] = ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
  @State select_week: number = now_week
  @State select_day: number = now_day
  @State select_order: number = now_order
  @State teaching_building_index :number=-1
  @State rooms_index :number=-1


  @Builder
  //自定义tab组件
  myBuilder(itemIndex:number,title: string, img: ResourceStr,selImg:ResourceStr) {
    //如果激活自己，图片和文本都需要改变样式，区分tabbar
    Column() {
      Image(itemIndex==this.selectIndex?selImg:img)
        .width(40)
      Text(title)
        .fontColor(itemIndex==this.selectIndex?Color.Black:Color.Black)
    }
  }

  build() {
    Tabs({ barPosition: BarPosition.End }) {

      //校历区域
      TabContent() {
        navItem01()
      }
      .tabBar(this.myBuilder(0,'校历', $r('app.media.xiaoli'),$r('app.media.highlightxiaoli')))

      //课程表区域
      TabContent() {
        navItem02(now_week,Classrooms)
      }
      .tabBar(this.myBuilder(1,'课程表', $r('app.media.kechenbiao'), $r('app.media.highlightkechenbiao')))
    }
    .animationDuration(0)
    .scrollable(false)
    .backgroundColor('D0D1D2')
    .onChange((index:number)=>{
      this.selectIndex = index
    })
  }
}