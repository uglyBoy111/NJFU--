import { now_week, now_day, now_order } from './My_Time';
import { courses, Classrooms, Teaching_building } from './My_Lessons';
let weeks: String[] = ['日', '一', '二', '三', '四', '五', '六'];

// 假设 p 是一个常量，指向 Classrooms 数组
const p = Classrooms;

function search(now_week: number, now_day: number, now_order: number): Teaching_building[] {
  // 创建一个空教室数组的副本
  let Empty_Classroom: Teaching_building[] = JSON.parse(JSON.stringify(p));

  // for 遍历所有课程和所有教室进行对比
  for (let i: number = 0; i < Empty_Classroom.length; i++) {
    for (let j: number = 0; j < Empty_Classroom[i].floors.length; j++) {
      for (let k: number = 0; k < Empty_Classroom[i].floors[j].rooms.length; k++) {
        for (let l: number = 0; l < courses.length; l++) {
          if (Empty_Classroom[i].floors[j].rooms[k] === courses[l].classroom
          && Empty_Classroom[i].name === courses[l].teaching_building
          && Empty_Classroom[i].floors[j].index === courses[l].floor
          && courses[l].time.week.includes(now_week)
          && now_day === courses[l].time.day
          && now_order >= courses[l].time.Start_order
          && now_order <= courses[l].time.End_order) {
            // 使用 filter 方法创建一个不包含特定教室的新数组
            Empty_Classroom[i].floors[j].rooms = Empty_Classroom[i].floors[j].rooms.filter(item => item !== courses[l].classroom);
          }
        }
      }
    }
  }

  // 返回副本数组，而不是原始的 Empty_Classroom 数组
  return Empty_Classroom;
}
@Entry
@Component
struct Search_Ability {
  @State select_week: number = now_week
  @State select_day: number = now_day
  @State select_order: number = now_order
  @State empty_classrooms: Teaching_building[] = search(this.select_week, this.select_day, this.select_order)
  build() {
    Column(){
      //下拉选择框行
      Row(){
        Select([
          { value: '第1周', icon: "/common/public_icon.svg" },
          { value: '第2周', icon: "/common/public_icon.svg" },
          { value: '第3周', icon: "/common/public_icon.svg" },
          { value: '第4周', icon: "/common/public_icon.svg" },
          { value: '第5周', icon: "/common/public_icon.svg" },
          { value: '第6周', icon: "/common/public_icon.svg" },
          { value: '第7周', icon: "/common/public_icon.svg" },
          { value: '第8周', icon: "/common/public_icon.svg" },
          { value: '第9周', icon: "/common/public_icon.svg" },
          { value: '第10周', icon: "/common/public_icon.svg" },
          { value: '第11周', icon: "/common/public_icon.svg" },
          { value: '第12周', icon: "/common/public_icon.svg" },
          { value: '第13周', icon: "/common/public_icon.svg" },
          { value: '第14周', icon: "/common/public_icon.svg" },
          { value: '第15周', icon: "/common/public_icon.svg" },
          { value: '第16周', icon: "/common/public_icon.svg" },
          { value: '第17周', icon: "/common/public_icon.svg" },
          { value: '第18周', icon: "/common/public_icon.svg" },
          { value: '第19周', icon: "/common/public_icon.svg" },
          { value: '第20周', icon: "/common/public_icon.svg" }])
          .selected(2)
          .value(`第${now_week}周`)
          .font({ size: 16, weight: 500 })
          .fontColor('#182431')
          .selectedOptionFont({ size: 16, weight: 400 })
          .optionFont({ size: 16, weight: 400 })
          .onSelect((index: number) => {
            this.select_week = index + 1
            this.empty_classrooms=search(this.select_week,this.select_day,this.select_order)
          })

        Select([
          { value: '周一', icon: "/common/public_icon.svg" },
          { value: '周二', icon: "/common/public_icon.svg" },
          { value: '周三', icon: "/common/public_icon.svg" },
          { value: '周四', icon: "/common/public_icon.svg" },
          { value: '周五', icon: "/common/public_icon.svg" },
          { value: '周六', icon: "/common/public_icon.svg" },
          { value: '周日', icon: "/common/public_icon.svg" }
        ])
          .selected(2)
          .value(`周${weeks[now_day]}`)
          .font({ size: 16, weight: 500 })
          .fontColor('#182431')
          .selectedOptionFont({ size: 16, weight: 400 })
          .optionFont({ size: 16, weight: 400 })
          .onSelect((index: number) => {
            this.select_day=index+1
            this.empty_classrooms=search(this.select_week,this.select_day,this.select_order)
          })

        Select([
          { value: '第1节课', icon: "/common/public_icon.svg" },
          { value: '第2节课', icon: "/common/public_icon.svg" },
          { value: '第3节课', icon: "/common/public_icon.svg" },
          { value: '第4节课', icon: "/common/public_icon.svg" },
          { value: '第5节课', icon: "/common/public_icon.svg" },
          { value: '第6节课', icon: "/common/public_icon.svg" },
          { value: '第7节课', icon: "/common/public_icon.svg" },
          { value: '第8节课', icon: "/common/public_icon.svg" },
          { value: '第9节课', icon: "/common/public_icon.svg" },
          { value: '第10节课', icon: "/common/public_icon.svg" },
          { value: '第11节课', icon: "/common/public_icon.svg" }])
          .selected(2)
          .value(`${now_order?('第'+now_order+'节课'):'未上课'}`)
          .font({ size: 16, weight: 500 })
          .fontColor('#182431')
          .selectedOptionFont({ size: 16, weight: 400 })
          .optionFont({ size: 16, weight: 400 })
          .onSelect((index: number) => {
            this.select_order=index + 1
            this.empty_classrooms=search(this.select_week,this.select_day,this.select_order)
          })
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('90%')
      .margin({
        left:18
      })

      Column(){
        Text('此时段空教室如下：')
          .margin({
            top:30,
            bottom:10
          })
          .fontSize(30)
          .fontStyle(FontStyle.Italic)
          .fontWeight(FontWeight.Bold)
        Row() {
          ForEach(this.empty_classrooms, (item1, index_i: number) => {
            Column() {
              Text(this.empty_classrooms[index_i].name)
                .fontSize(25)
                .fontWeight(FontWeight.Bold)
              ForEach(this.empty_classrooms[index_i].floors, (item2, index_j: number) => {
                ForEach(this.empty_classrooms[index_i].floors[index_j].rooms, (item3, index_k) => {
                  Text(`${this.empty_classrooms[index_i].floors[index_j].index}楼${this.empty_classrooms[index_i].floors[index_j].rooms[index_k]}`)
                    .fontSize(18)
                })
              })
            }
            .align(Alignment.Top)
            .width('50%')
            .height('100%')
          })
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
        .margin({
          left:30,
          right:30
        })
        .padding(50)
      }
      .width('100%')
      .height('100%')
    }
    .backgroundImage($r('app.media.seachimage1'))
    .backgroundImageSize(ImageSize.Cover)

  }
}
