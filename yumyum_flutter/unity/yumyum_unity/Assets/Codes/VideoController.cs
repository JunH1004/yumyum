using UnityEngine;
using UnityEngine.Video;

public class VideoController : MonoBehaviour
{
    public VideoPlayer videoPlayer;

    void Start()
    {
        // VideoPlayer 구성 요소 가져오기
        videoPlayer = GetComponent<VideoPlayer>();

        // 동영상 자동 재생
        videoPlayer.Play();
    }

    void Update()
    {
        // 동영상이 끝났을 때 다른 동작을 추가하려면
        if (!videoPlayer.isPlaying)
        {
            // 동영상 종료 후 실행할 코드
            // 예: 다음 씬으로 이동 또는 게임 시작
        }
    }
}
