import 'package:flutter/material.dart';
import 'package:salonman/core/constants/color_utils.dart';
import 'package:salonman/core/constants/image_utils.dart';
import 'package:salonman/core/widgets/component.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 192,
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,

            children: [
              Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: commonBoxDecoration(
                      image: DecorationImage(image: AssetImage(icMen)),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: commonBoxDecoration(
                        color: colorBannerButton,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(size: 20, Icons.edit_outlined),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              commonText(text: "Sameer Khan",fontSize: 18,fontWeight: FontWeight.w700)
            ],
          ),
        ),
        Divider(),
        commonView(),
        commonView(
          text: "Privacy",
          desc: "Block, set preferences, messages settings",
          icon: Icons.lock_outline_rounded,
        ),
        commonView(
          text: "Lists",
          desc: "Manage people, favorites",
          icon: Icons.list_alt_rounded,
        ),
        commonView(
          text: "Chats",
          desc: "Manage people",
          icon: Icons.chat_bubble_outline_rounded,
        ),
        commonView(
          text: "App language",
          desc: "English (IND)",
          icon: Icons.language_rounded,
        ),
        commonView(
          text: "App updates",
          desc: "Updated",
          icon: Icons.update_rounded,
        ),
        commonView(
          text: "Invite friend",
          desc: "Refer offer",
          icon: Icons.person_add_alt,
        ),
      ],
    );
  }

  Widget commonView({String? text, String? desc, IconData? icon}) {
    return ListTile(
      visualDensity: VisualDensity(vertical: -2),
      leading: Icon(
        icon ?? Icons.person_outline_rounded,
        color: colorTextLight,
      ),
      title: commonText(text: text ?? "Account", fontWeight: FontWeight.w600),
      subtitle: commonText(
        text: desc ?? "Name, email, phone number",
        color: colorTextLight,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ),
    );
  }
}
