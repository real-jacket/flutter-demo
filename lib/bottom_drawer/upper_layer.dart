import 'package:flutter/material.dart';
import 'package:rubber/rubber.dart';

class UpperLayer extends StatefulWidget {
  final RubberAnimationController controller;
  final ScrollController scrollController;
  UpperLayer({Key key, this.controller, this.scrollController})
      : super(key: key);

  @override
  _UpperLayerState createState() => _UpperLayerState();
}

class _UpperLayerState extends State<UpperLayer>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  var _isPageCanChanged = true;
  var _index = 0;
  // var _sortIndex = 0;

  TabController _tabController;
  PageController _pageController = PageController(initialPage: 0);

  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _show() {
    print("show");
    if (widget.controller.value < widget.controller.halfBound) {
      widget.controller
          .launchTo(widget.controller.value, widget.controller.halfBound);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(height: 0.6, color: Colors.black26),
        Container(
          decoration: BoxDecoration(color: Colors.white),
          width: MediaQuery.of(context).size.width,
          child: TabBar(
            onTap: (index) {
              if (!mounted) {
                return;
              }
              setState(() {
                _index = index;
              });
              _pageController.jumpToPage(index);
              if (index == 0) {
                _show();
              }
            },
            isScrollable: true,
            controller: _tabController,
            labelStyle: TextStyle(
                fontSize: 18,
                color: Color(0xFF333333),
                fontWeight: FontWeight.bold),
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Color(0xFF333333),
            labelColor: Color(0xff4688FA),
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.photo_size_select_actual),
              ),
              Tab(
                icon: Icon(Icons.tag_faces),
              ),
              Tab(
                icon: Icon(Icons.alternate_email),
              ),
              Tab(
                icon: Icon(Icons.link),
              ),
            ],
          ),
        ),
        Container(height: 0.6, color: Colors.black26),
        Expanded(
          child: PageView.builder(
            itemCount: 4,
            onPageChanged: (index) {
              if (_isPageCanChanged) {
                //由于pageview切换是会回调这个方法,又会触发切换tabbar的操作,所以定义一个flag,控制pageview的回调
                _onPageChange(index);
              }
            },
            controller: _pageController,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(color: Colors.cyan),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    controller: widget.scrollController,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          title: Text("Item ${_index * 10 + index}"));
                    },
                    itemCount: 100),
              );
            },
          ),
        ),
      ],
    );
  }

  _onPageChange(int index, {PageController p, TabController t}) async {
    if (p != null) {
      //判断是哪一个切换
      _isPageCanChanged = false;
      await _pageController.animateToPage(index,
          duration: Duration(milliseconds: 300),
          curve: Curves.ease); //等待pageview切换完毕,再释放pageivew监听
      _isPageCanChanged = true;
    } else {
      _tabController.animateTo(index); //切换Tabbar
    }
    setState(() {
      _index = index;
    });
  }

  @override
  bool get wantKeepAlive => true;
}
