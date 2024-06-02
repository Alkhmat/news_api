import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/cubit/api_cubit.dart';
import 'package:news_api/cubit/api_state.dart';

class ApiHome extends StatefulWidget {
  const ApiHome({super.key});

  @override
  State<ApiHome> createState() => _ApiHomeState();
}

class _ApiHomeState extends State<ApiHome> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        final cubit = context.read<ApiCubit>();
        cubit.fetchApi();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News API'),
      ),
      body: BlocBuilder<ApiCubit, ApiState>(
        builder: (context, state) {
          if (state is LoadingApiState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ResponseApiState) {
            final apies = state.api;
            return ListView.builder(
              itemCount: apies.length,
              itemBuilder: (context, index) {
                final api = apies[index];
                return Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  margin:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: api.urlToImage.isNotEmpty
                              ? Image.network(
                                  api.urlToImage,
                                  fit: BoxFit.cover,
                                )
                              : const Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 70,
                                ),
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          ''' ${api.description}''',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                );

                // return ListTile(
                //   title: Text(api.title),
                //   subtitle: Text(api.description),
                //   leading: api.urlToImage.isNotEmpty
                //       ? SizedBox(
                //           height: 60,
                //           width: 60,
                //           child:
                //               Image.network(api.urlToImage, fit: BoxFit.cover),
                //         )
                //       : const Icon(Icons.image_not_supported),
                // );
              },
            );
          } else if (state is ErrorApiState) {
            return Center(child: Text(state.error));
          }
          return const Center(child: Text('Unknown state'));
        },
      ),
    );
  }
}
